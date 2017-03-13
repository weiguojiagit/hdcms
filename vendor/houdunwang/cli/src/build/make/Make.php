<?php
/** .-------------------------------------------------------------------
 * |  Software: [HDPHP framework]
 * |      Site: www.hdphp.com
 * |-------------------------------------------------------------------
 * |    Author: 向军 <2300071698@qq.com>
 * |    WeChat: aihoudun
 * | Copyright (c) 2012-2019, www.hdphp.com. All Rights Reserved.
 * '-------------------------------------------------------------------*/
namespace houdunwang\cli\build\make;

use houdunwang\cli\build\Base;

class Make extends Base {
	//创建控制器
	public function controller( $arg, $type = 'controller' ) {
		$info       = explode( '.', $arg );
		$MODULE     = $info[0];
		$CONTROLLER = ucfirst( $info[1] );
		$file       = ROOT_PATH . '/app/' . $MODULE . '/controller/' . ucfirst( $CONTROLLER ) . '.php';
		//判断目录
		if ( ! is_dir( ROOT_PATH . '/app/' . $MODULE . '/controller' ) ) {
			$this->error( "Directory does not exist\n" );
		}
		//创建文件
		if ( is_file( $file ) ) {
			$this->error( 'Controller file already exists' );
		} else {
			$data = file_get_contents( __DIR__ . '/view/' . strtolower( $type ) . '.tpl' );
			$data = str_replace( [ '{{APP}}', '{{MODULE}}', '{{CONTROLLER}}' ], [
				c( 'app.path' ),
				$MODULE,
				$CONTROLLER
			], $data );
			file_put_contents( $file, $data );
		}
	}

	//创建模型
	public function model( $arg ) {
		$info  = explode( '.', $arg );
		$MODEL = ucfirst( $info[0] );
		$TABLE = strtolower( $info[0] );
		$file  = 'system/model/' . ucfirst( $MODEL ) . '.php';
		//创建模型文件
		if ( is_file( $file ) ) {
			$this->error( "Model file already exists" );
		} else {
			$data = file_get_contents( __DIR__ . '/view/model.tpl' );
			$data = str_replace( [ '{{MODEL}}', '{{TABLE}}' ], [ $MODEL, $TABLE ], $data );
			file_put_contents( $file, $data );
		}
	}

	//创建数据迁移
	public function migration( $name, $arg ) {
		$info = explode( '=', $arg );
		$file = ROOT_PATH . '/system/database/migrations/' . $name . '_' . date( 'Ymd' ) . '_' . time() . '.php';
		if ( $info[0] == '--create' ) {
			//创建模型文件
			$data = file_get_contents( __DIR__ . '/view/migration.create.tpl' );
			$data = str_replace( [ '{{TABLE}}', '{{className}}' ], [ $info[1], $name ], $data );
			file_put_contents( $file, $data );
		}
		if ( $info[0] == '--table' ) {
			//创建模型文件
			$data = file_get_contents( __DIR__ . '/view/migration.table.tpl' );
			$data = str_replace( [ '{{TABLE}}', '{{className}}' ], [ $info[1], $name ], $data );
			file_put_contents( $file, $data );
		}
	}

	//创建数据迁移
	public function seed( $name ) {
		$file = ROOT_PATH . '/system/database/seeds/' . $name . '_' . date( 'Ymd' ) . '_' . time() . '.php';
		//创建文件
		$data = file_get_contents( __DIR__ . '/view/seeder.tpl' );
		$data = str_replace( [ '{{className}}' ], [ $name ], $data );
		file_put_contents( $file, $data );
	}

	//创建标签
	public function tag( $name ) {
		$file = ROOT_PATH . '/system/tag/' . ucfirst( $name ) . '.php';
		if ( is_file( $file ) ) {
			$this->error( 'File already exists' );
		}
		//创建文件
		$data = file_get_contents( __DIR__ . '/view/tag.tpl' );
		$data = str_replace( [ '{{NAME}}' ], [ ucfirst( $name ) ], $data );
		file_put_contents( $file, $data );
	}

	//创建中间件
	public function middleware( $name ) {
		$file = ROOT_PATH . '/system/middleware/' . ucfirst( $name ) . '.php';
		if ( is_file( $file ) ) {
			$this->error( 'File already exists' );
		}
		//创建文件
		$data = file_get_contents( __DIR__ . '/view/middleware.tpl' );
		$data = str_replace( [ '{{NAME}}' ], [ ucfirst( $name ) ], $data );
		file_put_contents( $file, $data );
	}

	//创建应用密钥
	public function key() {
		$key     = md5( mt_rand( 1, 99999 ) . time() ) . md5( mt_rand( 1, 99999 ) . time() );
		$content = file_get_contents( 'system/config/app.php' );
		$content = preg_replace( '/(.*("|\')\s*key\s*\2\s*=>\s*)(.*)/im', "\\1'$key',", $content );
		file_put_contents( 'system/config/app.php', $content );
	}

	//创建中间件
	public function service( $name ) {
		$name  = ucfirst( $name );
		$files = [
			__DIR__ . '/view/service/HdForm.tpl',
			__DIR__ . '/view/service/HdFormFacade.tpl',
			__DIR__ . '/view/service/HdFormProvider.tpl',
		];
		//创建目录
		$dir = strtolower( 'system/service/' . $name );
		Dir::create( $dir );
		foreach ( $files as $f ) {
			$content = str_replace( '{{LOWER_NAME}}', strtolower( $name ), file_get_contents( $f ) );
			$content = str_replace( '{{NAME}}', $name, $content );
			if ( strpos( $f, 'Facade' ) !== false ) {
				file_put_contents( $dir . "/{$name}Facade.php", $content );
			} else if ( strpos( $f, 'Provider' ) !== false ) {
				file_put_contents( $dir . "/{$name}Provider.php", $content );
			} else {
				file_put_contents( $dir . "/{$name}.php", $content );
			}
		}
	}
}