# 前提
- ローカル環境で作業するとき、コマンドはすべて「GitBash」または「bash」で実施すること
- PowerShellは、特別に指示がない限り使わないこと
- リポジトリの中に、リポジトリを作らないこと
  - ※例えば、リポジトリ「ohara_uml」の中にリポジトリ「django_sample」をクローンしない
- VSCodeウィンドウはリポジトリの数だけ開いておき、Alt + Tab で切り替えること

# Docker Desktopのインストール
- [こちら](https://zenn.dev/upgradetech/articles/8e8b82e9d5c494)を参考に導入

# WSLのインストール
- ディストリビューションはUbuntu
- [こちら](https://zenn.dev/kuuki/articles/windows-ubuntu-insall)を参考に導入

# Dockerコンテナに入るまで
- VSCodeの拡張機能として[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)をインストール
- Docker Desktop を起動
- .exampleをそのままコピーして、.envを作成
- 左下の「><」のボタンを押下する
- 「コンテナで再度開く」を選択
- →コンテナに入ることができる
  - ※whoamiコマンドを実行すると、コンテナに入る前と入った後で、ユーザーが変わっていることを確認できる
- 上記の手順でうまく行かない場合、開いているディレクトリが間違っていないかよく確認すること

# Dockerコンテナから出る方法
- コンテナに入れていれば、左下の「><」ボタンが「開発コンテナ..」に変わっている
- 「開発コンテナ..」を押下する
- 「ローカルで再度開く」を選択

# コンテナに入ったあと、Hello Worldをするまで
- cd app
- python manage.py migrate
- python manage.py runserver 0.0.0.0:8000
- 127.0.0.1:8000/polls にアクセスし、views.pyの内容が表示されることを確認する
  - ※Dockerを使用しているため、原則として0.0.0.0は使用できない

## MySQLの初期設定
- 前提として、このサンプルリポジトリではSQLiteではなくMySQLを使用している
- 下記のコマンドを実行
```
$ cd app
$ python manage.py migrate
$ python manage.py createsuperuser
// username: root
// Email: (blank)
// password: rootroot
$ python manage.py runserver 0.0.0.0:8000
```
- http://127.0.0.1:8000/admin へアクセス
- 上記のusername, passwordでログインできることを確認

# その他、コンテナに入れないときには下記を確認
- 開いているディレクトリの階層が間違っていないかチェック（他の人にもみてもらう）
- Docker Desktopが停止していないかチェック
- 3306番ポートに関するエラーが出てしまう
  - 3306番ポートは、MySQLでよく使われる番号である
  - [こちら](https://qiita.com/Shime_texas/items/03b49cf42fbdaf0e2250)を参考に、MySQLサーバが自動的に立ち上がっていないかチェック
  - django_sampleのコンテナと、卒業制作用のコンテナが同時に立ち上がっていないかチェック→Docker Desktopにて、片方を停止する
  - 卒業制作用のリポジトリのポート番号を変えてもOK ※調べながらやってみてください

# その他、Gitについて困ったときは下記を確認
- username, emailなどを求められる = ユーザー認証ができていない場合、[こちら](https://hirofurukawa.com/check-register-username-mail/)
- Commit, Pushするときに差分が大量に出てしまう場合
  - Dockerコンテナ内でPushを行うと、全ファイルの差分が発生してしまう。ことがある。ソースコードの変更はないが、権限が変わっていることが差分の原因。下記のコマンドを実行
  - git config core.whitespace cr-at-eol
  - もし既に発生した場合は、変更内容をステージに上げれば直るはず

# pythonanywhereのデプロイ
1. [アカウント登録](https://www.pythonanywhere.com/)
2. BashConsole作成
   1. pip3.9 install --user pythonanywhere
   2. $ pa_autoconfigure_django.py --python=3.9 --branch=<branchname>https://github.com/<username>/<repositoryname>.git
