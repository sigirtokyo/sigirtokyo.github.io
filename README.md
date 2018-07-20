# ACM SIGIR 東京支部 HP更新方法

## 更新の準備

1. `git`，`hugo`をインストール
2. githubレポジトリをクローン
3. devブランチをチェックアウト

クローンは下記のコマンドで行うことができます：
```
git clone https://github.com/sigirtokyo/sigirtokyo.github.io.git
```

チェックアウトは下記のコマンドで行うことができます：
```
git checkout dev
```

チェックアウト後にthemeをインストールしてください。
https://github.com/halogenica/beautifulhugo の中身をthemesディレクトリ以下に追加します。

```
git clone https://github.com/halogenica/beautifulhugo themes/beautifulhugo
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
というコマンドが利用可能です．

## 更新方針

- 基本的に`post`を使用する
- 最新情報： `post`に`tags = ["news"]`を設定．
- イベント： `post`に`tags = ["news", "イベント"]`を設定．`subtitle`に日時と場所を書く．
- セミナー： `post`に`tags = ["news", "イベント", "セミナー"]`を設定．`subtitle`に日時と場所を書く．


## プレビュー

以下のコマンドを実行しておくことで，`http://localhost:1313/`にて変更内容をリアルタイムに確認できます：
```
hugo server
```

本番環境を変更する前に，以下のコマンドで他の方にも見せることが可能です（要パスワード）：
```
sh deploy_dev.sh
```

このコマンドを実行すると，`http://mpkato.net/sigirtokyo_preview/`にファイルがアップロードされます（要認証）．

変更したコードは適宜，devブランチにcommit，pushしてください．
pushは下記のコマンドを使います：
```
git push origin dev
```

## 本番環境の更新

このレポジトリの`master`ブランチがそのままWebに公開されています．
そのため，本番環境の更新は`master`ブランチの内容を`push`することで行えます．
`deploy_pro.sh`は下記のことを自動的に実行してくれます．

1. `hugo`コマンドを実行し，`public`フォルダに作成済みのHTML等を書き出す
2. `git checkout master`で`master`ブランチをチェックアウト
3. `public`フォルダの内容で`master`ブランチを更新
4. `git add .`，`git commit`および`git push`で`master`ブランチを`push`
5. `git checkout dev`で`dev`ブランチに戻る

