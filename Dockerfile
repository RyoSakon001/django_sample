FROM python:3.13

# 作業ディレクトリ
WORKDIR /code

RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 依存関係ファイルをコピー
COPY requirements.txt /code/

# Python 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトをコピー
COPY /app/ /code/