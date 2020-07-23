# WASEREL

早稲田大学創造理工学部経営システム工学科2年春学期必修授業「情報システム開発演習」の最終課題として作成した疑似アパレルECサイトです

<img src="./images/usage.gif" width=500 />

## Busuness Schema

|||
|---|---|
|対象|10~20代の若者|
|主要販売商品|ストリートアパレルブランド|
|スキーマ|ホーム画面で商品を一覧表示→詳細画面からカートに追加|


## Environment

- Java Server Pages
- MySQL(H2)
- Tomcat

## Usage

### 0. DBを準備

H2サーバ内で、migrate.sqlに記載しているクエリを順番に実行してください

### 1. リポジトリをsdev/webapp/に配置

```
$ cd sdev/webapp && git clone git@github.com:masatsch/waserel-web-app.git
```

### 2. Run

```
$ cd ../.. && java -jar webapp-server-2020.jar
```

### 3. Enjoy

[こちらのサーバー](http://localhost:8080/waserel/)に入り、以下のログイン情報でログインしてください

|||
|---|---|
|email|example@gmail.com|
|password|example|
