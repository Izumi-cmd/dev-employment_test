# 1. ed25519形式の作成手順

`ed25519`形式の`sshキー`を作成します。

## 1. SSHキーの生成

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- `-t ed25519`: 明示的に、ED25519アルゴリズムを指定
- `-C "your_email@example.com"`: キーに関連付けるメールアドレス

## 2. 保存先の確認

```text
Enter file in which to save the key (/c/Users/YOU/.ssh/id_ed25519):
```

- デフォルトのファイル名でよい場合はEnterを押下
- 別名で保存する場合は任意のパスを入力

```text
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

- セキュリティ向上のためパスフレーズの設定を推奨
- パスフレーズは空でも可能

## 3. 生成の確認

```bash
cd ~/.ssh
ls -la
```

生成されたファイル:
- `id_ed25519`: 秘密鍵
- `id_ed25519.pub`: 公開鍵

## 4. SSHエージェントへの登録

```bash
# SSHエージェントの起動
eval "$(ssh-agent -s)"

# 秘密鍵をSSHエージェントに登録
ssh-add ~/.ssh/id_ed25519
```

## 注意事項

- 作成した秘密鍵は絶対に共有しないでください
