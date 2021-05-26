## オンボーディング

- config/master.key → 確認してください
- .env → 各自ローカルのSMTP用のGmailの設定を追加してください

## docker


docker ビルド + 起動
```
docker-compose up --build
```


起動しているコンテナの名前を確認
```
docker-compose ps
```

コンテナ名を指定してコンテナの中に入る(ex. コンテナ名がprm_app_1だった場合)
```
docker exec -it prm_app_1 bash
```

webpack起動
```
docker-compose exec app bin/webpack-dev-server
```

## er図

```
bundle exec erd --attributes=foreign_keys,content
```



## デプロイ関係

### DBリセット

```
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
```

### プリコンパイル

```
rails assets:precompile RAILS_ENV=production
```

### 本番停止

プロセス確認
```
ps aux | grep puma
```

プロセス停止
```
kill -9 プロセスID
```

### 本番起動

```
bundle exec rails s -e production&
```
# 本番環境
### アプリケーションに移動
`cd /var/www/deploy/partner_success`

### 最新状態をfetch
`git fetch`

### 最新状態に更新する
`git reset --hard origin/main`

### bundle install
`bundle install`

### DBmigrate
`bundle exec rails db:migrate RAILS_ENV=production`

### 古いアセット削除
`bundle exec rake assets:clobber RAILS_ENV=production`

### アセットプリコンパイル
`bundle exec rake assets:precompile RAILS_ENV=production`

### サーバー&&Sidekiq再起動
`sudo systemctl stop puma && sudo systemctl start puma; bundle exec sidekiq -C config/sidekiq.yml&`

※sidekiqをデーモン化するために末尾に `&`を付ける
