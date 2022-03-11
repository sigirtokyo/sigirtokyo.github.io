# ACM SIGIR 東京支部 HP更新方法

## 更新の準備

1. `git`，`hugo`をインストール
2. githubレポジトリをクローン

クローンは下記のコマンドで行うことができます：
```
git clone git@github.com:sigirtokyo/sigirtokyo.github.io.git
```
もしくは
```
git clone https://github.com/sigirtokyo/sigirtokyo.github.io.git
```


チェックアウト後にhugoのthemeを以下のコマンドでインストールしてください：

```
git submodule update --init --recursive
```

## メニューの更新

`config.toml`ファイルの以下の箇所を更新してください：
```
[[menu.main]]
    identifier = "about"
    name = "About"
    weight = 1

[[menu.main]]
    parent = "about"
    name = "東京支部について"
    url = "page/about/"
    weight = 1

...
```

1つ目の[[menu.main]]の箇所でメニューの
第1階層（何もしていない状態で表示される）を定義しています．
`identifier`は任意の変数名，`name`は表示されるメニュー名，
`weight`はメニューの順序（小さい方が左側に来る）を指定しています．

2つ目の[[menu.main]]の箇所でメニューの
第2階層（parentである第1階層をクリックした際に表示される）を定義しています．
`parent`は第1階層の`identifier`，`name`は表示されるメニュー名，
`url`はクリックした際に遷移するページ，
`weight`はメニューの順序（小さい方が上側に来る）を指定しています．

## 内容の更新

`content`にページおよびポストの内容が含まれています．
`page`には静的ページ，`post`には投稿ページの内容がMarkdownファイルで記述されています．

新しい静的ページを作成する際には，
```
hugo new page/page_name.md
```
新しい投稿ページを作成する際には，
```
hugo new post/YYYY-MM-DD-page_name.md
```
というコマンドが利用可能です．このコマンドを発行すると，テンプレートファイルができます。このファイルを修正します。

## 更新方針

- 基本的に`post`を使用する
- 最新情報： `post`に`tags = ["news"]`を設定．
- イベント： `post`に`tags = ["news", "イベント"]`を設定．`subtitle`に日時と場所を書く．
- セミナー： `post`に`tags = ["news", "イベント", "セミナー"]`を設定．`subtitle`に日時と場所を書く．


## プレビュー

（md ファイルのヘッダの Draft行を削除して保存します。）

以下のコマンドを実行しておくことで，`http://localhost:1313/`にて変更内容をリアルタイムに確認できます：
```
hugo server
```

本番環境を変更する前に，以下のコマンドで他の方にも見せることが可能です（要パスワード）：
```
sh deploy_dev.sh
```

このコマンドを実行すると，`http://mpkato.net/sigirtokyo_preview/`にファイルがアップロードされます（要認証）．

変更したコードは適宜，devブランチにcommitしてください．

## 本番環境の更新

このレポジトリの`master`ブランチがそのままWebに公開されています．
ただし，一貫性を保つために`master`ブランチは直接編集せず，単に`dev`ブランチをプッシュしてください．
`dev`ブランチがプッシュされると自動的にGithub Actionsによって`master`ブランチが更新されます．


pushは下記のコマンドを使います：
```
git push origin dev
```
