# 5. `Github`への`GPGキー`の登録
# GitHubへのGPGキー登録手順

## 前提条件
- GPGがインストールされていること
- GitHubアカウントを持っていること

## GPGキーの作成

1. GPGキーペアの生成
```bash
gpg --full-generate-key
```

2. キーの一覧を表示して、作成したキーのIDを確認
```bash
gpg --list-secret-keys --keyid-format=long
```

3. GPG公開キーのエクスポート（keyidは上記で確認したID）
```bash
gpg --armor --export <keyid>
```

## GitHubへの登録手順

1. GitHubにログイン

2. 右上のプロフィールアイコンから「Settings」を選択

3. サイドバーから「SSH and GPG keys」を選択

4. 「New GPG key」ボタンをクリック

5. 先ほどエクスポートした公開キーを貼り付け

6. 「Add GPG key」をクリック

## Gitの設定

1. GPGキーの設定（keyidは上記で確認したID）
```bash
git config --global user.signingkey <keyid>
```

2. コミット時の署名を有効化
```bash
git config --global commit.gpgsign true
```

## 動作確認

1. テストコミットの作成
```bash
git commit -S -m "GPG署名テスト"
```

2. GitHubでコミットを確認し、「Verified」バッジが表示されることを確認

## トラブルシューティング

- GPGキーが認識されない場合：
```bash
export GPG_TTY=$(tty)
```

- パスフレーズの入力を省略する場合：
```bash
echo "pinentry-mode loopback" >> ~/.gnupg/gpg.conf
```

## 参考リンク
- [GitHubヘルプ - GPGキーの生成](https://docs.github.com/ja/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [GitHubヘルプ - GPGキーの追加](https://docs.github.com/ja/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)
