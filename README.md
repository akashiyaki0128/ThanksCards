# README


## アプリケーション名
### ***ThanksCards***

## アプリケーション概要	
**ありがとうカードを送る為のアプリ。** 
ありがとうカードを送り合うシステムを導入することで、職場のコミュニケーションの活性化に繋げ、
働く仲間の生産性をあげる。1対1だけでのやり取りで完結することなく、
組織ベースで取組を活性化させていくために、送られたありがとうカードを共有可能にすることで、
良例・事例の共有及び影響の拡大に繋がり、組織内のコミュニケーションを更に活性化させる。

#### コンセプト
**ありがとうカードを送りたくなるようなアプリケーション**
- 誰でも楽しめること（ゲーム性）
- 送ることにメリットがあること（バリュー）
- 送ることによるデメリットがないこと（操作性）

## 背景
ありがとうカードの取組を紙ベースでやっている職場で複数箇所働いてきたが、
ありがとうカードの仕組み事態が形骸化・作業化している所を多く目の当たりにしてきた。
仕組み事態は素晴らしいものであり、職場のコミュニケーション活性化に大きく寄与するものではあるので、
この形骸化・作業化してしまう問題を解決していきたい。この問題が起こりうる理由として、
紙の作成工数、保管場所の管理、管理方法、記入工数、面白み等が挙げられる。
これらを解決するためのアプリケーションを開発していく。
また、取組事態が作業化していかないように、面白みやワクワク感を常に感じられるような、
動的な仕組みや流行のコンテンツを起用等、日々のアップデートが重要であることを念頭に置いておく。


#### URL	
http://52.14.73.99/

#### テスト用アカウント	 
①email: kaba@rice,password: kaba555
②email: cat@rice,password: cat555

#### 利用方法	 
新規登録orログイン→ありがとうカードを贈る→メインページとマイページに贈ったカードが反映される

#### 目指した課題解決、誰のどんな問題を解決するか	
１，自分のありがとうカードを見返したい時のための保存先が欲しかった。
２，社風・企業文化として感謝の気持ち・言葉を根付かせたい企業の企業文化の浸透に貢献する

### ER図
https://gyazo.com/a817e095b2609a6e55f32c0874819d51

### CSS
bootstrapを使用



## users テーブル


| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :cards
- has_one :activity , dependent: :destroy
- has_many :receive_cards
- has_many :send_cards
- has_one_attached :image

## activities テーブル

| Column        | Type       | Options | 
| ------------- | ---------- | ------- | 
| depertment_id | integer    |         | 
| philosophy_id | integer    |         | 
| hobby         | string     |         | 
| good_thing    | string     |         | 
| user          | references |         | 
### Association

- belongs_to :user,optional: true
- belongs_to_active_hash :depertment
- belongs_to_active_hash :philosophy

## send_cards テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| card   | references | null: false, foreign_key: true |

### Association

- belongs_to :card
- belongs_to :user

## receive_cards テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| card   | references | null: false, foreign_key: true |

### Association

- belongs_to :card
- belongs_to :user

## cards テーブル

| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ | 
| content      | text       | null: false                    | 
| send_user    | references | null: false, foreign_key: true | 
| receive_user | references | null: false, foreign_key: true | 
### Association

- belongs_to :send_user, class_name: "User"
- belongs_to :receive_user,class_name: "User"