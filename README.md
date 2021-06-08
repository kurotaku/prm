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

### bundle install
```
bundle install
```

### DBリセット

```
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
```

### Seeder

```
RAILS_ENV=production bundle exec rails db:seed
```

### 古いアセット削除
```
rails assets:clobber RAILS_ENV=production
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
