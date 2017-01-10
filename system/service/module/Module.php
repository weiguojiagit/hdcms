<?php namespace system\service\module;

use system\model\Modules;
use system\model\ModulesBindings;
use system\model\ModuleSetting;
use system\model\SiteModules;
use system\model\UserPermission;

/**
 * 模块管理服务
 * Class Module
 * @package system\service\module
 * @author 向军 <2300071698@qq.com>
 * @site www.houdunwang.com
 */
class Module {
	//删除模块时的关联数据表
	protected $relationTables = [
		'rule',
		'module_setting',
		'site_modules',
		'ticket_module',
		'modules_bindings',
	];
	protected $industry = [
		'business'  => '主要业务',
		'customer'  => '客户关系',
		'marketing' => '营销与活动',
		'tools'     => '常用服务与工具',
		'industry'  => '行业解决方案',
		'other'     => '其他'
	];

	/**
	 * 检测模块是否已经安装
	 *
	 * @param $module
	 *
	 * @return bool
	 */
	public function isInstall( $module ) {
		return Modules::where( 'name', $module )->first() || is_dir( "module/{$module}" );
	}

	/**
	 * 验证当前用户在当前站点
	 * 能否使用当前模块
	 * 具体模块动作需要使用权限标识独立验证
	 * @return bool
	 * @throws \Exception
	 */
	public function verifyModuleAccess() {
		//操作员验证
		if ( ! \User::isOperate() ) {
			return false;
		}
		//系统模块不受限制
		if ( v( "module.is_system" ) == 1 ) {
			return true;
		} else {
			//站点是否含有模块
			if ( ! $this->hasModule( SITEID, v( 'module.name' ) ) ) {
				return false;
			}
			//插件模块
			$allowModules = UserPermission::where( 'siteid', SITEID )
			                              ->where( 'uid', Session::get( 'user.uid' ) )->lists( 'type' );
			if ( ! empty( $allowModules ) ) {
				return in_array( v( 'module.name' ), $allowModules );
			}

			return true;
		}
	}

	/**
	 * 调用模块方法
	 *
	 * @param string $module 模块.方法
	 * @param array $params 方法参数
	 *
	 * @return mixed
	 */
	function api( $module, $params ) {
		static $instance = [ ];
		$info = explode( '.', $module );
		if ( ! isset( $instance[ $module ] ) ) {
			$data                = Modules::where( 'name', $info[0] )->first();
			$class               = 'addons\\' . $data['name'] . '\api';
			$instance[ $module ] = new $class;
		}

		return call_user_func_array( [ $instance[ $module ], $info[1] ], $params );
	}

	/**
	 * 验证站点是否拥有模块
	 *
	 * @param int $siteId 站点编号
	 * @param string $module 模块名称
	 *
	 * @return bool
	 * @throws \Exception
	 */
	public function hasModule( $siteId = 0, $module = '' ) {
		$siteId = $siteId ?: SITEID;
		$module = $module ?: v( 'module.name' );
		if ( empty( $siteId ) || empty( $module ) ) {
			return false;
		}
		$modules = $this->getSiteAllModules( $siteId );
		foreach ( $modules as $m ) {
			if ( strtolower( $module ) == strtolower( $m['name'] ) ) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取站点模块数据
	 * 包括站点套餐内模块和为站点独立添加的模块
	 *
	 * @param int $siteId 站点编号
	 * @param bool $readFromCache
	 *
	 * @return array|mixed
	 * @throws \Exception
	 */
	public function getSiteAllModules( $siteId = 0, $readFromCache = true ) {
		$siteId = $siteId ?: SITEID;
		if ( empty( $siteId ) ) {
			throw new \Exception( '$siteid 参数错误' );
		}
		static $cache = [ ];
		if ( isset( $cache[ $siteId ] ) ) {
			return $cache[ $siteId ];
		}
		//读取缓存
		if ( $readFromCache ) {
			if ( $data = d( "modules:{$siteId}" ) ) {
				return $data;
			}
		}
		//获取站点可使用的所有套餐
		$package = \Package::getSiteAllPackageData( $siteId );
		$modules = [ ];
		if ( ! empty( $package ) && $package[0]['id'] == - 1 ) {
			//拥有[所有服务]套餐
			$modules = Modules::get() ? Modules::get()->toArray() : [ ];
		} else {
			$moduleNames = [ ];
			foreach ( $package as $p ) {
				$moduleNames = array_merge( $moduleNames, $p['modules'] );
			}
			$moduleNames = array_merge( $moduleNames, $this->getSiteExtModulesName( $siteId ) );
			if ( ! empty( $moduleNames ) ) {
				$res     = Db::table( 'modules' )->whereIn( 'name', $moduleNames )->get();
				$modules = $res ?: [ ];
			}
		}
		//加入系统模块
		$modules = array_merge( $modules, Modules::where( 'is_system', 1 )->get() );
		foreach ( $modules as $k => $m ) {
			$m['subscribes']  = json_decode( $m['subscribes'], true ) ?: [ ];
			$m['processors']  = json_decode( $m['processors'], true ) ?: [ ];
			$m['permissions'] = array_filter( json_decode( $m['permissions'], true ) ?: [ ] );
			$binds            = ModulesBindings::where( 'module', $m['name'] )->get();
			$binds            = $binds ?: [ ];
			foreach ( $binds as $b ) {
				$m['budings'][ $b['entry'] ][] = $b;
			}
			$modules[ $k ] = $m;
		}
		cache( "modules:{$siteId}", $modules );
		p($modules);
		return $cache[ $siteId ] = $modules;
	}

	/**
	 * 当前使用的非系统模块
	 * @return array
	 */
	public function currentUseModule() {
		foreach ( v( 'site.modules' ) as $v ) {
			if ( $v['name'] == v( 'module.name' ) ) {
				return $v;
			}
		}

		return [ ];
	}

	/**
	 * 用户在站点使用的模块列表
	 *
	 * @param int $siteId 站点编号
	 * @param int $uid 用户编号
	 *
	 * @return mixed
	 */
	public function getBySiteUser( $siteId = 0, $uid = 0 ) {
		$siteId = $siteId ?: SITEID;
		$uid    = $uid ?: v( 'user.info.uid' );
		/**
		 * 插件模块列表
		 */

		$modules = UserPermission::where( 'type', '<>', 'system' )
		                         ->where( 'siteid', $siteId )
		                         ->where( 'uid', $uid )
		                         ->lists( 'type' ) ?: [ ];

		//获取模块按行业类型
		return $this->getModulesByIndustry( $modules );
	}

	/**
	 * 按行业获取当前站点的模块列表
	 * 根据当前使用站点拥有的模块获取
	 * 系统管理员获取所有模块
	 *
	 * @param array $modules 限定模块(只有这些模块获取)
	 *
	 * @return array
	 */
	public function getModulesByIndustry( $modules = [ ] ) {
		$data = [ ];
		foreach ( (array) v( 'site.modules' ) as $m ) {
			if ( ( empty( $modules ) || in_array( $m['name'], $modules ) ) && $m['is_system'] == 0 ) {
				$data[ $this->industry[ $m['industry'] ] ][] = [
					'title' => $m['title'],
					'name'  => $m['name']
				];
			}
		}

		return $data;
	}

	/**
	 * 模块标题列表
	 * @return array
	 */
	public function getModuleTitles() {
		return [
			'business'  => '主要业务',
			'customer'  => '客户关系',
			'marketing' => '营销与活动',
			'tools'     => '常用服务与工具',
			'industry'  => '行业解决方案',
			'other'     => '其他'
		];
	}

	/**
	 * 获取模块配置
	 *
	 * @param string $module 模块名称
	 *
	 * @return array
	 */
	public function getModuleConfig( $module = '' ) {
		$module  = $module ?: v( 'module.name' );
		$setting = ModuleSetting::where( 'siteid', SITEID )->where( 'module', $module )->pluck( 'setting' );

		return $setting ? unserialize( $setting ) : [ ];
	}

	/**
	 * 获取站点扩展模块数据
	 *
	 * @param string $siteId 网站编号
	 *
	 * @return array
	 */
	public function getSiteExtModules( $siteId ) {
		$module = SiteModules::where( 'siteid', $siteId )->lists( 'module' );

		return $module ? Modules::whereIn( 'name', $module )->get() : [ ];
	}

	/**
	 * 获取站点扩展模块名称列表
	 *
	 * @param int $siteId 站点编号
	 *
	 * @return array
	 */
	public function getSiteExtModulesName( $siteId ) {
		return SiteModules::where( 'siteid', $siteId )->lists( 'module' ) ?: [ ];
	}

	/**
	 * 从系统中删除模块
	 *
	 * @param string $module 模块名称
	 * @param bool $removeData 删除模块数据
	 *
	 * @return bool
	 */
	public function remove( $module, $removeData = false ) {
		//删除封面关键词数据
		if ( $removeData ) {
			//执行卸载程序
			$this->uninstall( $module );
		}
		//更新套餐数据
		\Package::removeModule( $module );
		foreach ( $this->relationTables as $t ) {
			Db::table( $t )->where( 'module', $module )->delete();
		}
		Modules::where( 'name', $module )->delete();
		//更新所有站点缓存
		\Site::updateAllCache();

		return true;
	}

	/**
	 * 卸载模块时执行模块配置文件中的卸载SQL语句或文件
	 *
	 * @param string $module 模块名称
	 *
	 * @return bool
	 */
	public function uninstall( $module ) {
		//本地安装的模块删除处理
		$configFile = 'addons/' . $module . '/package.json';
		if ( is_file( $configFile ) ) {
			$config = json_decode( file_get_contents( $configFile ), true );
			//卸载数据
			$installSql = trim( $config['uninstall'] );
			if ( ! empty( $installSql ) ) {
				if ( preg_match( '/.php$/', $installSql ) ) {
					$file = 'addons/' . $module . '/' . $installSql;
					if ( ! is_file( $file ) ) {
						$this->error = '卸载文件:' . $file . '不存在';

						return false;
					}
					require $file;

					return true;
				} else {
					return \Schema::sql( $installSql );
				}
			}
		}

		return true;
	}
}