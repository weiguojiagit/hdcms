<?php namespace module\news;

/**
 * 图文消息处理模块
 *
 * @author 后盾网
 * @url http://open.hdcms.com
 */
use module\hdProcessor;

class processor extends hdProcessor {
    public function handle( $rid ) {
        $parentNews = Db::table( 'reply_news' )->where( 'rid', $rid )->where( 'pid', 0 )->orderBy( 'rand()' )->first();
        if ( $parentNews ) {
            $news = Db::table( 'reply_news' )->where( 'pid', $parentNews['id'] )->get() ?: [ ];
            array_unshift( $news, $parentNews );
            foreach ( $news as $f ) {
                $d['title']       = $f['title'];
                $d['discription'] = $f['description'];
                $d['picurl']      = __ROOT__ . '/' . $f['thumb'];
                $d['url']         = $f['url'] ? __ROOT__ . "/index.php{$f['url']}" : __ROOT__ . "/index.php?s=article/entry/news&id={$f['id']}&siteid=" . v( 'site.siteid' );
                $data[]           = $d;
            }
            $this->news( $data );

            return TRUE;
        }
    }
}