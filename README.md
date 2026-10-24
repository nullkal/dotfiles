# nullkal/dotfiles: ぬるかるの個人用CLI環境設定

このリポジトリには、nullkal(ぬるかる)が個人的に使用しているCLI環境の設定スクリプトが置かれています。[twpayne/chezmoi](https://github.com/twpayne/chezmoi) を利用しています。

このリポジトリの内容は自由に参考にして構いません。

## セットアップ方法

```sh
$ sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply nullkal
```

## ディレクトリ構成

`.chezmoiroot` で `home/` を設定ファイルの起点に指定しています。配置対象の dotfiles、chezmoi のテンプレート・データ・フックは `home/` に置きます。例えば、`home/dot_config/git/config.tmpl` は `~/.config/git/config` に配置されます。

`README.md` や `AGENTS.md` など、リポジトリ管理用のファイルはルートに置きます。
