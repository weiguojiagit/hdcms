<?php namespace module\news\system;

/**
 * 测试模块模块定义
 *
 * @author 后盾网
 * @url http://open.hdcms.com
 */
use module\HdRule;
use system\model\ReplyNews;

class Rule extends HdRule {

	public function __construct() {
		parent::__construct();
		auth( 'reply_news' );
	}

	public function fieldsDisplay( $rid = 0 ) {
		//要嵌入规则编辑页的自定义内容，这里 $rid 为对应的规则编号，新增时为 0
		$contents = [ ];
		if ( $rid ) {
			//顶级菜单
			$contents = Db::table( 'reply_news' )->where( 'rid', $rid )->where( 'pid', 0 )->orderBy( 'rank', 'desc' )->orderBy( 'id', 'ASC' )->get();
			//子级菜单
			foreach ( $contents as $k => $t ) {
				$news                       = Db::table( 'reply_news' )
				                                ->where( 'rid', $rid )
				                                ->where( 'pid', $t['id'] )
				                                ->orderBy( 'id', 'ASC' )
				                                ->get();
				$contents[ $k ]['son_news'] = $news ?: [ ];
			}
		}
		View::with( 'contents', json_encode( $contents ?: [ ], true ) );

		return View::fetch( $this->template . '/fieldsDisplay.html' );
	}

	public function fieldsValidate( $rid = 0 ) {
		if ( ! Request::post( 'content' ) ) {
			return '内容不能为空';
		}

		return '';
	}

	public function fieldsSubmit( $rid ) {
		ReplyNews::where( 'rid', $rid )->delete();
		$content = json_decode( $_POST['content'], true );
		foreach ( $content as $c ) {
			//添加一级图文
			$model    = new ReplyNews();
			$c['rid'] = $rid;
			$id       = $model->save( $c );
			//添加二级图文
			foreach ( $c['son_news'] as $d ) {
				$model    = new ReplyNews();
				$d['rid'] = $rid;
				$d['pid'] = $id;
				$model->save( $d );
			}
		}
	}

	public function ruleDeleted( $rid ) {
		//删除规则时调用，这里 $rid 为对应的规则编号
		ReplyNews::where( 'rid', $rid )->delete();
	}
}