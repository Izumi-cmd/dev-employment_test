# Docker環境での調査マニュアル


## 発生状況
課題に沿って、dockerfileを作成時dockerコンテナが起動したので
`localhost:3000`にアクセスした際に以下のエラーが発生を確認

## 1. エラー
- ブラウザ：`ERR_EMPTY_RESPONSE`
- ログ：`Module not found: Error: Can't resolve './src'`

## 2. 調査手順
```bash
# コンテナの起動確認
docker ps -a

# ログ確認
docker logs <container_id>
```

## 3. 原因
1. ホストバインディングの制限
  調査結果
   - ログに表示されたURL：`http://localhost:8080/`
   - ネットワークアドレス：`http://172.18.0.2:8080/`
  ポートの不一致を発見

   - Webpackのデフォルト設定：`localhost`のみリッスン。コンテナ外からアクセス不可

2. ソースコードマウント未設定
  dockerのログから
  ```text
  Error: Can't resolve './src' in '/usr/src/app'
  /usr/src/app/src doesn't exist
  ```
   - マウント設定がないためソースコードがコンテナ内に存在しない。
   - コンテナ内のファイル構造が不完全と推測

## 4. 解決策
### Webpack設定修正
ポートを定義
```javascript
devServer: {
  host: '0.0.0.0',
  port: 3000
}
```

### Docker Compose設定修正
ボリュームのマウントを定義
```yaml
services:
  web:
    volumes:
      - ./app:/usr/src/app
      - /usr/src/app/node_modules
```

## 5. 確認手順
再度、ボリュームを作成
```bash
# 再ビルド・起動
docker compose down
docker compose up --build -d

# ログ確認
docker logs <container_id>
```

## 6. ブラウザを確認
`localhost:3000`にアクセスして`Hello World`と表示されることを確認
