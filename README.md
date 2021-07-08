# 環境構築

### git clone

```
git clone このリポジトリ
```

### Docker ビルド、立ち上げ

```
docker-compose up --build
```

### Database 作成

```
docker-compose exec app rails db:create
```

### Migrate

```
docker-compose exec app rails db:migrate
```

### Seed

```
docker-compose exec app rails db:seed
```

# 概要
### 代理店営業管理クラウド

Salesforceライクに販売代理店の売り上げ管理が行えるSFAです。

![capture 2021-07-08 11 13 37](https://user-images.githubusercontent.com/15335845/124854496-60871300-dfe2-11eb-8ace-78a5ac3a1353.png)

Salseforceの様に各主要テーブルに対する項目をユーザーが自由に追加することを可能にし、Salseforceで成立させている業務プロセスの置き換えにも対応しています。(積み上げ集計にも対応)

![capture 2021-07-08 11 46 48](https://user-images.githubusercontent.com/15335845/124854819-e5722c80-dfe2-11eb-99f3-c4ec0d45cf79.png)

CSVインポート・エクスポート機能により既存の基幹システムは置き換えずに、追加で社外の販売代理店のセールス管理・分析を行うケースにも対応しています。

![capture 2021-07-08 11 14 07](https://user-images.githubusercontent.com/15335845/124855135-7a752580-dfe3-11eb-80b9-702aff801ee9.png)

分析するテーブルと項目、さらにそれをグループ化する項目を選んでダッシュボード上にグラフを自由に追加できます。位置や順番、大きさもマウス操作で変更できます。

![capture 2021-07-02 11 25 36](https://user-images.githubusercontent.com/15335845/124855650-36365500-dfe4-11eb-87ec-417645f0fa85.png)

小規模開発ながらマルチテナントで実現するには大量のデータ(1次代理店、2次代理店、その配下と1社/1日あたり数千件の案件情報が更新される)をセールステックで活用すべく、リアルタイムに個社毎に自由に作成したグラフに描画し分析するというニーズに対応するために、Salseforceとは異なり制限を設けています。
- テーブルは自由に作成できず、代理店ビジネスを行う上での基本的なテーブルをプリセットで用意している。(カスタムオブジェクトはできない)
- カスタム項目は各データ型事に上限数を設けている。
- 各テーブルには各データ型用のカラムを用意していて、それらをカスタム項目と割り当てるアーキテクトを採用している。

![erd](https://user-images.githubusercontent.com/15335845/124858863-ce830880-dfe9-11eb-884c-c279bc7d27cf.png)

## 言語・フレームワーク

### バックエンド
Ruby on Rails

### フロントエンド - React.js(react-railsでviewに埋め込み)

チャット機能
![capture 2021-07-08 13 48 35](https://user-images.githubusercontent.com/15335845/124864402-cc25ac00-dff3-11eb-9749-db5933c588e7.png)

ダッシュボード機能
![capture 2021-07-08 11 13 37](https://user-images.githubusercontent.com/15335845/124864416-d3e55080-dff3-11eb-82a7-290423c46277.png)

商談フェイズの使用の切り替え
![capture 2021-07-08 13 49 38](https://user-images.githubusercontent.com/15335845/124864456-e1023f80-dff3-11eb-95c2-723fcccfc4ca.png)

### フロントエンド - jQuery + erb

上記以外

### CI/CD

Circle CIでrubocopとrspecのみ検査。CDは現状なし。

### インフラ構成

ALB　　　　　CroudFront

|　　　　　　　　　|

EC2 　　　ー　　　S3

|

RDS


# ER図
![erd](https://user-images.githubusercontent.com/15335845/124859398-d42d1e00-dfea-11eb-9fbd-36d72f816564.png)


