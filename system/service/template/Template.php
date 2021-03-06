<?php namespace system\service\template;

use system\model\Package;
use system\model\SiteTemplate;
use system\model\Template as TemplateModel;

/**
 * 模板管理类
 * Class Template
 * @package system\service\template
 * @author 向军 <2300071698@qq.com>
 * @site www.houdunwang.com
 */
class Template {
	/**
	 * 获取站点扩展模板数据
	 *
	 * @param int $siteId 网站编号
	 *
	 * @return array
	 */
	public function getSiteExtTemplates( $siteId ) {
		$template = SiteTemplate::where( 'siteid', $siteId )->lists( 'template' );

		return $template ? TemplateModel::whereIn( 'name', $template )->get() : [ ];
	}

	/**
	 * 获取站点扩展模板
	 *
	 * @param int $siteId 站点编号
	 *
	 * @return array
	 */
	public function getSiteExtTemplateName( $siteId = 0 ) {
		$siteId = $siteId ?: SITEID;

		return Db::table( 'site_template' )->where( 'siteid', $siteId )->lists( 'template' );
	}

	/**
	 * 获取站点所有模板
	 *
	 * @param int $siteId 站点编号
	 * @param string $industry 模板类型
	 *
	 * @return array|mixed
	 * @throws \Exception
	 */
	public function getSiteAllTemplate( $siteId = 0, $industry = '' ) {
		$siteId = $siteId ?: SITEID;
		if ( empty( $siteId ) ) {
			throw new \Exception( '站点编号不存在' );
		}
		static $cache = [ ];
		if ( isset( $cache[ $siteId ] ) ) {
			return $cache[ $siteId ];
		}
		//系统模板默认包含
		$db = Db::table( 'template' )->where( 'tid', '>', 0 )->orWhere( 'is_system', 1 );
		//获取站点可使用的所有套餐
		$package = \Package::getSiteAllPackageData( $siteId );
		if ( ! empty( $package ) && $package[0]['id'] == - 1 ) {
			//拥有[所有服务]套餐时可以使用模板
			if ( $industry ) {
				$db->where( 'industry', $industry );
			}

			$templates = $db->get();
		} else {
			$templateNames = [ ];
			foreach ( (array) $package as $p ) {
				$templateNames = array_merge( $templateNames, $p['template'] );
			}
			$templateNames = array_merge( $templateNames, $this->getSiteExtTemplateName( $siteId ) );
			if ( ! empty( $templateNames ) ) {
				if ( $industry ) {
					$db->where( 'industry', $industry );
				}
				$db->whereIn( 'name', $templateNames );
			}
			$templates = $db->get();
		}

		return $cache[ $siteId ] = $templates;
	}

	/**
	 * 获取模板位置数据
	 *
	 * @param $tid 模板编号
	 *
	 * @return array
	 * array(
	 *  1=>'位置1',
	 *  2=>'位置2',
	 * )
	 */
	public function getPositionData( $tid ) {
		$position = Db::table( 'template' )->where( 'tid', $tid )->pluck( 'position' );
		$data     = [ ];
		if ( $position ) {
			for ( $i = 1; $i <= $position; $i ++ ) {
				$data[] = [ 'position' => $i, 'title' => '位置' . $i ];
			}
		}

		return $data;
	}

	/**
	 * 获取模板类型
	 * @return array
	 */
	public function getTitleLists() {
		return [
			'often'       => '常用模板',
			'rummery'     => '酒店',
			'car'         => '汽车',
			'tourism'     => '旅游',
			'drink'       => '餐饮',
			'realty'      => '房地产',
			'medical'     => '医疗保健',
			'education'   => '教育',
			'cosmetology' => '健身美容',
			'shoot'       => '婚纱摄影',
			'other'       => '其他'
		];
	}

	/**
	 * 获取文章模块的使用的模板数据
	 * @return mixed
	 */
	public function getTemplateData() {
		$name = Db::table( 'web' )->where( 'siteid', SITEID )->pluck( 'template_name' );
		if ( $name ) {
			return Db::table( 'template' )->where( 'name', $name )->first();
		}
	}

	/**
	 * 删除模板
	 *
	 * @param $name 模板标识
	 *
	 * @return bool
	 */
	public function remove( $name ) {
		$model = TemplateModel::where( 'name', $name )->first();
		if ( $model['is_system'] ) {
			message( '系统模板不允许删除', '', 'back' );
		}
		//删除模板数据
		$model->destory();
		//更新套餐数据
		$package = Db::table( 'package' )->get() ?: [ ];
		foreach ( $package as $p ) {
			$p['template'] = json_decode( $p['template'], true ) ?: [ ];
			if ( $k = array_search( $name, $p['template'] ) ) {
				unset( $p['template'][ $k ] );
			}
			Package::where( 'id', $p['id'] )->update( $p );
		}
		//更新站点缓存
		\Site::updateAllCache();

		return true;
	}
}