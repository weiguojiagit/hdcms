<?php
$database = [
	//读库列表
	'read'     => [ ],
	//写库列表
	'write'    => [ ],
	//开启读写分离
	'proxy'    => FALSE,
	//主机
	'host'     => 'localhost',
	//类型
	'driver'   => 'mysql',
	//帐号
	'user'     => '',
	//密码
	'password' => '',
	//数据库
	'database' => '',
	//表前缀
	'prefix'   => 'hd_'
];

return array_merge( $database, include 'data/database.php' );