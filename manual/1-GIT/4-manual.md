# 4. ed25519形式のGPGキーの作成

## 前提条件
- gpgコマンドが使用できること
```bash
gpg --version
```

ない場合は以下のコマンドを実行してインストール：

### macOS
```bash
brew install gnupg pinentry-mac
```

### Windows
[gpg4win.org](https://gpg4win.org/)からインストーラをダウンロードしてください

## 手順

### 1. GPGキーの生成
```bash
gpg --full-generate-key
```

### 2. キーの種類を選択
今回は`ed25519`形式のためECCを選択します。

```bash
Please select what kind of key you want:
   (1) RSA and RSA
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (9) ECC (sign and encrypt) *default*
   (10) ECC (sign only)
Your selection? 9
```

今回は`9`を選択します。

### 3. 楕円曲線の選択
```bash
Please select which elliptic curve you want:
   (1) Curve 25519 *default*
   (2) Curve 448
Your selection? 1
```

`Curve 25519`を選択してください。

### 4. 有効期限の設定
```bash
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
```

鍵の有効期限を設定します。
`0`を選択することで無期限に設定することができます。

### 5. 個人情報の入力
```bash
Real name: #名前
Email address: #メールアドレス
Comment: #任意のコメント
```

Git Commitの署名に使用する場合はGitHubに登録されているメールアドレスを設定する必要があります。

```bash
Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? 
```

`o`を入力して次へ進みます。

### 6. パスフレーズの設定
セキュリティのため、強力なパスフレーズを設定してください。2回入力する必要があります。

### 7. 公開鍵の確認
```bash
gpg -K
```

保管されている公開鍵を確認することができます。

## 注意事項
- セキュリティのため、パスフレーズは安全に保管してください
- 必要に応じてキーの有効期限を設定してください
