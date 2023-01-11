# README

### 初回環境構築

Dockerをダウンロード、インストールしてください。

&raquo; [Mac版Docker Desktop](https://download.docker.com/mac/stable/Docker.dmg)
&raquo; [Windows版Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)


```
git clone https://github.com/hirokaz/rwanda_shopping.git
cd rwanda_shopping
```

ビルドと起動
```
docker-compose build
docker-compose up
```

DB作成とデータマイグレーション実行
upしたものとは別のコンソールで以下を実行
```
docker-compose exec web bundle exec rails db:create db:migrate db:seed
```

ブラウザで以下のURLにアクセスし、画面が表示されることを確認
```
http://localhost:3000/
```

### 通常の起動

```
docker-compose up
```

### データマイグレーション実行

```
docker-compose exec web bundle exec rails db:migrate db:seed
```

### Rails console実行

```
docker-compose exec web bundle exec rails c
```

### bundle install実行

Gemfileを変更した後はbundle installを実行する

```
docker-compose exec web bundle install
```

これを実行後、dockerを再起動したほうがよい

### 停止

CTRL + C
で停止

念のため以下のコマンドを実行してもよい
```
docker-compose down
```
