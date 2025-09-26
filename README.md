# 環境構築の手順
# Docker環境の構築
- VSCodeの拡張機能として Dev Containers をインストール
- Docker Desktop を起動
- コンテナに入る

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




# pythonanywhereのデプロイ
1. [アカウント登録](https://www.pythonanywhere.com/)
2. BashConsole作成
   1. pip3.9 install --user pythonanywhere
   2. $ pa_autoconfigure_django.py --python=3.9 --branch=<branchname>https://github.com/<username>/<repositoryname>.git
