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

# Dockerコンテナから出る方法
- コンテナに入れていれば、左下の「><」ボタンが「開発コンテナ..」に変わっている
- 「開発コンテナ..」を押下する
- 「ローカルで再度開く」を選択

# コンテナに入ったあと、Hello Worldをするまで
- 
## MySQLの初期設定

1. .envを作成
2. コマンド
```
$ cd app
$ python manage.py migrate
$ python manage.py createsuperuser
// username: root
// Email: (blank)
// password: rootroot
$ python manage.py runserver 0.0.0.0:8000
```
3. http://127.0.0.1:8000/admin/login/?next=/admin/ へアクセス
4. 上記のusername, passwordでログインできることを確認

# Databaseのスキーマ変更
1. Modelを変更
2. python manage.py makemigrations app_name
3. python manage.py migrate

## その他
#### タイムゾーン変更
```
// settings.py 100行目付近
LANGUAGE_CODE = 'ja'
TIME_ZONE = 'Asia/Tokyo'
```

## Gitの設定変更
Dockerコンテナ内でPushを行うと、全ファイルの差分が発生してしまう。
ソースコードの変更はないが、権限が変わっていることが差分の原因。下記のコマンドを実行
```
# git config core.whitespace cr-at-eol
```


# pythonanywhereのデプロイ
1. [アカウント登録](https://www.pythonanywhere.com/)
2. BashConsole作成
   1. pip3.9 install --user pythonanywhere
   2. $ pa_autoconfigure_django.py --python=3.9 --branch=<branchname>https://github.com/<username>/<repositoryname>.git
