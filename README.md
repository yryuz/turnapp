# README

## アプリケーション名
「Turn App」

Turn Upというスラング英語から名付けました。
意味は「めちゃくちゃ盛り上がる！」です。

## アプリケーション概要
画像と音楽を結び付けて同時投稿出来るアプリケーションです。

## URL
https://turnapp-35205.herokuapp.com/

## テスト用アカウント

メールアドレス test@test
パスワード ttt000

メールアドレス aaa@aaa
パスワード aaa000

## 目指した課題解決
10代、20代の方を中心に、画像と音楽を同時に投稿することができ共有することが出来るアプリケーションの開発を目指しました。
自分の見た景色や風景に合う音楽を投稿し共有でき、他人の感性を目と耳で感じることができます。


## 実装した機能についての説明

### ユーザー新規登録画面
https://gyazo.com/f6881347dc61f5351e4edbfceb311ae4
必要事項を入力し登録ボタンを押すとユーザーが新規登録されます。

### 投稿機能、、投稿一覧表示機能
https://gyazo.com/e4de36fa0df457c27b4c7b760d9f8695
必要事項を入力し投稿するボタンを押すと新規投稿が完了します。

https://gyazo.com/1d3407decdd6b990a433cd66d871c47c
マイページやログアウト、投稿に関わるモノはプルダウンで表示されます。
自分以外のユーザーが投稿したモノは詳細表示のみ可能です。

### ユーザー情報編集機能(マイページ)
https://gyazo.com/a2526c356b55bae5bfefc4f7bc3b607d
マイページの編集するボタンを押すとユーザー情報の編集が可能になります。

### 投稿詳細表示機能
https://gyazo.com/139a227cb9c586f05277d548e1c1bbc5
画像をクリックすると、外部の動画投稿サイトに自動で遷移します。

### ユーザー詳細画面(他のユーザーページ)
https://gyazo.com/64bcc667d40bcbc37f2486dcd5db317f
投稿者名をクリックするとユーザー詳細画面に遷移します。
https://gyazo.com/c8be8892b0822c38bb1a1f139c2914d0
ログイン中の別のユーザーにはフォローボタンが表示されます。
https://gyazo.com/96943dde83fcf56d2056eaeb37f3ae6c
未ログインのユーザーにはフォローボタンが表示されません。

### ユーザーフォロー機能
https://gyazo.com/27b564a4b95162e6f264c85d2a34937d
ユーザー詳細画面のフォローボタンを押すとフォローが完了します。
マイページよりフォローしたユーザーの確認が可能です。

https://gyazo.com/2eea34d6452dea415b277257eeb70239
フォローボタンを押すと瞬時にフォローが完了し、ボタンがフォロー解除ボタンに切り替わります。
フォロー解除ボタンを押すとフォローの解除が可能です。

### 投稿情報編集機能
https://gyazo.com/2c280be4b0886535c5350c2c4c2f2c6f
プルダウンの編集ボタンを押すと投稿の編集画面に遷移します。
投稿するボタンを押すと情報の更新が完了し、更新の完了を知らせる画面に遷移します。

### 投稿削除機能
https://gyazo.com/2dc13a12cf142c1912521a634be9090a
プルダウンの削除ボタンを押すと投稿の削除が完了し、削除の完了を知らせる画面に遷移します。

### コメント機能
https://gyazo.com/5fb50c76212e8ec7051ba6a75f6e566f
投稿詳細画面からコメントの投稿が可能です。
https://gyazo.com/d0d25f746f9b18e66a5ae017f78e97f8
未ログインのユーザーはコメントの投稿が出来ないようにしてあります。

## 特に工夫したポイント
ユーザーが快適にブラウザ操作することが出来るよう、Ajaxを使ったフォロー機能の実装には特にこだわりました。
データベースの設計、アソシエーションにとても苦労しましたが、細かく分解して考えることにより確からしい設計ができたと思います。
ビューの部分では、初めて **.js.erbというファイル名のファイルを作成に挑戦しました。


## 使用技術(開発環境)

### バックエンド
Ruby,Ruby on Rails 

### フロントエンド
HTML,CSS,JavaScript

### データベース
MySQL,SequelPro

### ソース管理
GitHub,GitHubDesktop

### テスト
RSpec

### エディタ
VSCode


## DB設計

### usersテーブル

Column | Type | Options
-|-|-
nickname | string | null: false
email | string | null:false, unique: true
encrypted_password | string | null: false
year | integer | null: false
introduction | text | null: false

#### Association 

- has_many :tunes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :relationships, dependent: :destroy
- has_many :followings, through: :relationships, source: :follower
- has_many :passive_relationships, foreign_key: true, dependent: :destroy
- has_many :followers, through: :passive_relationships, source: :user

### tunesテーブル

Column | Type | Options
-|-|-
url | string | null: false
name | string | null: false
artist | string | null: false
genre_id | integer | null: false
text | text | null: false
user_id | integer | null: false, foreign_key: true

#### Association

- belongs_to :user
- has_many :comments


### commentsテーブル

Column | Type | Options
-|-|-
user | references | null: false, foreign_key: true
tune | references | null: false, foreign_key: true
comment | text | null: false


#### Association
- belongs_to  :user
- belongs_to  :tune


### relationshipsテーブル

Column | Type | Options
-|-|-
user_id | references | null: false, foreign_key: true
follower_id | references | null: false, foreign_key: true

#### Association

- belongs_to :user
- belongs_to :follower








