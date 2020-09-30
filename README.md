# このアプリについて
![スクリーンショット 2020-09-29 19 49 30](https://user-images.githubusercontent.com/62044473/94549554-5f73c900-028d-11eb-937c-ff0f0ca0b1b8.png)
このアプリはスマホカバーをはじめとする様々なカバーを取り扱う予定のECサイトを想定して作成しました。実際に商品を登録して販売する想定です。

# テスト用アカウント
- テストユーザー：
email: “test@example.com”
password: ‘password’

# サイトURL
- アドレス: https://beyourcover.com/

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

### 商品ページ
![image](https://user-images.githubusercontent.com/62044473/94556698-7b309c80-0298-11eb-8b43-872b67ae7cab.png)

### 商品詳細ページ
![image](https://user-images.githubusercontent.com/62044473/94557576-b8e1f500-0299-11eb-8db6-0e1b65abb31d.png)

### カートページ
![image](https://user-images.githubusercontent.com/62044473/94557947-3b6ab480-029a-11eb-850d-dfad4908736c.png)

### 購入ページ
![image](https://user-images.githubusercontent.com/62044473/94563821-30b41d80-02a2-11eb-82a8-0f0183207462.png)

### 購入確認ページ
![image](https://user-images.githubusercontent.com/62044473/94564563-1169c000-02a3-11eb-817e-9362158dd3c1.png)


# DB設計
## ER図
![BeYourCover ER Diagram](https://user-images.githubusercontent.com/62044473/94570147-7b856380-02a9-11eb-913e-8aa005d89d38.png)
