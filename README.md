# [Docker_for_Ruby_on_Rails](https://github.com/prgyukke/Docker_for_Ruby_on_Rails)
## はじめに
Ruby on Rails開発環境用のDockerです。  
プロジェクトディレクトリを`app`コンテナ内の`/var/www/app`にマウントしています。  
OSXにて、[Docker For Mac](https://www.docker.com/docker-mac)のインストール前提です。  
[Docker Community Edition for Mac - Docker Store](https://store.docker.com/editions/community/docker-ce-desktop-mac)の[Get Docker]をクリックしてダウンロード後、インストールしてください。
  
### 各バージョン
- Ruby 2.5
- Rails 5.2.0

## 環境構築
### 初回のみ
```
$ git clone git@github.com:prgyukke/Docker_for_Ruby_on_Rails.git
$ cd Docker_for_Ruby_on_Rails/
$ rm -rf .git
$ git init
$ docker-compose up -d --build
```

appコンテナに入る
```
$ docker exec -it docker_for_ruby_on_rails_app_1 /bin/bash
# bundle install
# (必要であれば)migrate
# rails db:migrate
```

### 2回目以降
```
$ cd Docker_for_Ruby_on_Rails/
$ docker-compose up -d
```

### コンテナに入る際
```
$ docker exec -it docker_for_ruby_on_rails_app_1 /bin/bash
```

### コンテナを抜ける際
```
# コンテナ上にて
# exit
```

### 開発終了時
```
$ docker-compose down
```

## rails sについて
`rails s`でビルトイサーバを立ち上げる場合、下記の方法で行ってください。
また、ブラウザ上では`localhost:3000`にアクエスしてください。
```
# appコンテナ上にて
# rails s -b '0.0.0.0'
```

## 自動テストについて
このレポジトリではRSpecを採用しています。  
binstubをインストールしています。
自動テストの際には下記の方法で実行してください。

```
# appコンテナ上にて
# bin/rspec
```
