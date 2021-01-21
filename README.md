# score_app
## アプリケーションの概要
楽譜のpdfファイルを投稿して共有するSNSアプリです。

## アプリケーション機能一覧
* pdfファイル＆その説明文投稿機能
* 投稿へのいいね機能
* ユーザー登録機能
* 登録済みユーザーにログインを要求する認証機能
* 投稿、いいね、フォローをログイン時にしか使えなくする認証機能
* 投稿された楽譜のサイト内検索＆表示機能
* 一覧ページのページネーション機能

## アプリケーション内で使用している技術一覧
* 開発環境：　macOS上にVirtualBoxとVagrantを用いて仮想環境を構築
  * VirtualBox: 6.1.16
  * Vagrant: 2.2.14
  * centOS: 7.3
* アプリ構築に使用した言語&フレームワーク：　Ruby, Ruby on Rails
  * Ruby: 2.4.2p198
  * Ruby on Rails: 5.1.7
* 使用したデータベース
  * production環境： Postgresql
  * test環境: spring
  * development環境：　sqlite3
* 各機能実装に用いたgem
  * レイアウトの整形
    * bootstrap
  * pdfファイル投稿機能
    * carrierwave 
  * ページネーション機能
    * will_paginate, bootstrap-will_paginate
  * サンプルデータ生成
    * faker
