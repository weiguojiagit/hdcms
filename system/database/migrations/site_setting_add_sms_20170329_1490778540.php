<?php namespace system\database\migrations;

use houdunwang\database\build\Migration;
use houdunwang\database\build\Blueprint;

class site_setting_add_sms extends Migration {
	//执行
	public function up() {
		Schema::table( 'site_setting', function ( Blueprint $table ) {
			//短信通知
			$table->string( 'sms',3000 )->comment('短信通知设置')->add();
		} );
	}

	//回滚
	public function down() {

	}
}