<?php
/** .-------------------------------------------------------------------
 * |  Software: [HDPHP framework]
 * |      Site: www.hdphp.com  www.hdcms.com
 * |-------------------------------------------------------------------
 * |    Author: 向军 <2300071698@qq.com>
 * |    WeChat: aihoudun
 * | Copyright (c) 2012-2019, www.houdunwang.com. All Rights Reserved.
 * '-------------------------------------------------------------------*/
namespace app\site\controller;

use houdunwang\request\Request;
use system\model\Router as RouterModel;

/**
 * 模块路由规则
 * Class Router
 * @package app\site\controller
 */
class Router {
	public function lists() {
		auth( 'system_router' );
		if ( IS_POST ) {
			$data = json_decode( Request::post( 'data' ), true );
			foreach ( $data as $d ) {
				if ( ! empty( $d['title'] ) && ! empty( $d['router'] ) && ! empty( $d['url'] ) ) {
					$model = isset( $d['id'] ) ? RouterModel::find( $d['id'] ) : new RouterModel();
					$model->save( $d );
				}
			}
			message( '路由规则保存成功' );
		}
		$data = Db::table( 'router' )->where( 'siteid', siteid() )->where( 'module', v( 'module.name' ) )->get();
		View::with( 'data', json_encode( $data, JSON_UNESCAPED_UNICODE ) );

		return view();
	}
}