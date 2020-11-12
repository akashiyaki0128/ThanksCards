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

## 背景
ありがとうカードの取組を紙ベースでやっている職場で複数箇所働いてきたが、
ありがとうカードの仕組み事態が形骸化・作業化している所を多く目の当たりにしてきた。
仕組み事態は素晴らしいものであり、職場のコミュニケーション活性化に大きく寄与するものではあるので、
この形骸化・作業化してしまう問題を解決していきたい。この問題が起こりうる理由として、
紙の作成工数、保管場所の管理、管理方法、記入工数、面白み等が挙げられる。
これらを解決するためのアプリケーションを開発していく。
また、取組事態が作業化していかないように、面白みやワクワク感を常に感じられるような、
動的な仕組みや流行のコンテンツを起用等、日々のアップデートが重要であることを念頭に置いておく。


#### URL	デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
#### テスト用アカウント	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
#### 利用方法	このアプリケーションの利用方法を説明しましょう。
#### 目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
#### 洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
#### 実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
#### 実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。
#### データベース設計	ER図等を添付しましょう。
#### ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

### CSS
bootstrapを使用






## users テーブル

Things you may want to cover:
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :entries
- has_many :rooms, through: entries
- has_many :cards

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :entries
- has_many :users, through: entries
- has_many :cards

## entries テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## cards テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user