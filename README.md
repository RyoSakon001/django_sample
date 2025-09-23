# django_template

- Web
    サイト作る
- Databases
    MySQLで作る
    元々がSQLiteなのでまだできない
- Consoles
    Bash
        デプロイ
            pa_autoconfigure_django.py --python=3.9 https://github.com/RyoSakon001/django_sample.git --nuke --branch=main





# 手順

## SQLiteの初期設定

1. コマンド
```
$ cd app
$ python manage.py migrate
$ python manage.py createsuperuser
// username: root
// Email: (blank)
// password: rootroot
$ python manage.py runserver 0.0.0.0:8000
```
2. http://127.0.0.1:8000/admin/login/?next=/admin/ へアクセス
3. 上記のusername, passwordでログインできることを確認

## その他
タイムゾーン変更
```
// settings.py 100行目付近
LANGUAGE_CODE = 'ja'
TIME_ZONE = 'Asia/Tokyo'
```
