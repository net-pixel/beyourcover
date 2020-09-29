# このアプリについて
![スクリーンショット 2020-09-29 19 49 30](https://user-images.githubusercontent.com/62044473/94549554-5f73c900-028d-11eb-937c-ff0f0ca0b1b8.png)
このアプリはスマホカバーをはじめとする様々なカバーを取り扱う予定のECサイトを想定して作成しました。

# テスト用アカウント
- テストユーザー：
email: “test@example.com”
password: ‘password’ 

# サイトURL
- アドレス: http://175.41.196.102/

# 実装内容
## マークアップ
TOPページ
ユーザー新規登録/ログインページ
商品詳細ページ
カートページ
商品購入確認ページ
ユーザーマイページ

## サーバーサイド
### 自動デプロイ
- gem 'capistrano'
- gem 'capistrano-rbenv'
- gem 'capistrano-bundler'
- gem 'capistrano-rails'
- gem 'capistrano3-unicorn'
- gem 'fog-aws'
### ユーザー新規登録/ログイン/ログアウト（ウィザード形式での住所登録）
- gem 'devise'
### 商品出品・編集機能（ドラッグ&ドロップでの画像投稿）
- gem 'carrierwave'
- gem 'mini_magick'
- gem 'active_hash'
- gem 'jquery-rails'
### 商品詳細情報表示（マウスホバー＆クリックでの拡大画像表示）
- gem 'jquery-rails'
### 商品削除機能
### 商品一覧機能
- カテゴリー別、関連商品の表示
### 商品購入機能（クレジットカード登録。情報表示）
- gem 'payjp'
### 商品についての質問・コメント機能（出品者タグ＆完売後のコメントブロック）
### カテゴリー機能
- gem 'ancestry'
- gem 'jquery-rails'
### キーワード検索機能
- gem 'jquery-rails'
- ransackと独自メゾットの併用での検索
### その他機能
- メール/パスワード変更機能
- 住所変更機能
- プロフィール画像・紹介文登録・編集機能
### バリデーションの日本語化
- gem 'rails-i18n'



# DB設計
## ER図