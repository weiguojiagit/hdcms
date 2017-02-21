<?php namespace addons\salary\system;

/**
 * 模块模板视图标签
 * 支持模块间调用
 * @author 后盾团队
 * @url http://www.hdcms.com
 */
class Tag{
	/**
	 * 标签定义
	 *
	 * @param array $attr 标签使用的属性
	 * @param string $content 块标签包裹的内容
	 *
	 * @return string
	 * 调用方法: <tag action="salary.show" id="1" name="hdphp"></tag>
	 */
	public function show( $attr, $content ) {
		return '这是标签内容';
	}
}