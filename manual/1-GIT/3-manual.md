# 3. `Github` への `sshキー` の登録

作成した`sshキー`を`GitHub`への登録を行います。

## 前提条件
- SSHキーを作成済みであること
- GitHubへアカウントを登録済みであること

## 1. 公開鍵の内容をコピー
以下のコマンドを実行し、公開鍵の情報を取得します。
```bash
# Macの場合
pbcopy < ~/.ssh/id_ed25519.pub

# Windowsの場合 (Git Bash)
cat ~/.ssh/id_ed25519.pub | clip
```

## 2. GitHubでの登録

GitHubのサイトで登録操作を行います。

1. GitHubへの設定ページ（`https://github.com/settings/keys`）を開きます
2. "New SSH key" をクリックします
3. "Title" に識別用の任意の名前を入力します（例：My Laptop）
4. "Key" に先ほどコピーした公開鍵を貼り付けます
5. "Add SSH key" をクリックして保存します

## 3. 接続を確認

ターミナルに戻り、以下のコマンドを実行します。

```bash
ssh -T git@github.com
```

成功すると、以下のメッセージが表示されます。
```text
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

## 注意事項
- 公開鍵のみを登録し、秘密鍵は決して登録しない
