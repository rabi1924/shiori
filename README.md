# README

# アプリケーション名
shiori

# アプリケーション概要
読書メモをデジタル化し、交流機能を兼ね備えたオリジナルアプリ

# URL
https://shiori-37746.herokuapp.com/

# テスト用アカウント
●Basic認証ID：admin
●Basic認証PASS：2222
●メールアドレス：
●パスワード：

# 利用方法
※作成中

# アプリケーションを作成した背景
(対象者が抱えている課題)
●読書の醍醐味は「読書メモ」を残し、そのメモに基づき「学びのアウトプットをすること」にあると考える。
→ただ、現状「読書メモ」がノート等の紙媒体やメモ機能を持ったアプリ等、ユーザーによってツールがバラバラしているのと、
「読書メモ」に特化したツールになっていないので、メモの効率や質を上げにくい。
→また、アウトプットをシェアする手段として、現状「自分の知人」との「直接的対話」に偏っており、「語れる相手」と「対話方法」にアナログ的な制限を感じる。
→個人的に、読書は本当に素晴らしい趣味だと思っている一方で(「読書が趣味の人」に尊敬できる人が多い)、読書自体に「静的で地味なイメージ」が根強く、
読書自体に抵抗感がある人が多いと感じる。

(上記課題を解決する為の提案)
●「読書メモ」に特化したメモアプリを開発する事で、メモの効率や質を上げられるのでは(「読書メモ」のアプリ化による利便性の向上)
●デジタル化された「読書メモ」にSNSの機能を持たせる事で、「(知人でなくても)共通の興味関心を持った相手」と「時間や場所に縛られず気軽に」
アウトプットのシェアができるのでは(「読書メモ」のSNS化による「対話のアナログ的な制限」を撤廃)
●加え、読書に+「(アクティブに)発信する場」を設ける事で、「読書と発信」をセットで捉え、発信する側のアクティブな側面を活かし、
最終的に読書それ自体が抱える抵抗感を払拭できるのでは(「発信する場」を設ける事による読書のイメージ改善)

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1n6YFPF2zs3DY3FdV5lqO7efuPskNUEQow1iZk_3Jwrs/edit#gid=982722306

# 実装した機能についての画像やGIF及びその説明
※作成中

# 実装予定の機能
※作成中

# データベス設計
## users テーブル

| Column             |  Type  | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique|
| encrypted_password | string | null: false |
| book               | string | 
| profile            |  text  | 

### Association

- has_many :memos
- has_many :comments

## memos テーブル

| Column |  Type  | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| goal   |  text  | null: false |
| action |  text  | 
| note   |  text  | 
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  |    Type    | Options                        |
| ------  | ---------- | ------------------------------ |
| content |    text    | null: false                    |
| memo    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :memo
- belongs_to :user

# 画面遷移図
※作成中

# 開発環境
●フロントエンド
●バックエンド
●インフラ
●テスト
●テキストエディタ
●タスク管理

# 工夫したポイント
※作成中

