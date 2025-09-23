FROM python:3.13

# 作業ディレクトリ
WORKDIR /code

# 依存関係ファイルをコピー
COPY requirements.txt /code/

# 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトをコピー
COPY /app/ /code/