# 2.git-flowのローカル設定

`git-flow`のローカル設定を行います。

## 1. インストール手順
使用しているOSによりインストールが必要な場合があります。

### macOS
```bash
brew install git-flow
```

### Windows
```bash
# 基本的に追加インストールは不要です
```

### Linux(Ubuntu/Debian)
```bash
apt-get install git-flow
```

## 2. git-flowの初期化、初期設定
リポジトリの初期化を行います。以下のコマンドを実行してください
```bash
git flow init
```

コマンド実行後、初期設定を行います。

```bash
Branch name for production releases: [main]
Branch name for "next release" development: [develop]
Feature branches? [feature/]
Release branches? [release/]
Hotfix branches? [hotfix/]
Support branches? [support/]
Version tag prefix? []
```

- 指定がない限りはデフォルトで問題ありません。

## 3. ローカルの設定
個人の開発環境を設定します

- ユーザー名の設定
```bash
git config user.name "Your_Name"
```

- メールアドレスの設定
```bash
git config user.email "your_email@example.com"
```
