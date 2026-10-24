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

## Zsh 設定

`~/.zshrc` は `~/.config/zsh/zshrc/` 直下の通常ファイル `*.zsh` をファイル名順で自動的に読み込みます。番号で読み込み順を指定し、設定を追加するときはこのフォルダに配置します。フォルダが空・未作成でもエラーにはなりません。

- `10-tools.zsh`: PATH・mise の初期化
- `20-ls.zsh`: ls の色・エイリアス（OS ごとにテンプレートで展開）
- `30-plugins.zsh`: Sheldon 経由で環境・履歴・補完設定を読み込み
- `50-keybindings.zsh`: キーマップ・履歴検索のキー割り当て
- `60-aliases.zsh`: OS 別のコマンド・Neovim のエイリアス
- `70-prompt.zsh`: プロンプト表示

補完の色設定より先に ls の色を設定し、個別のキー割り当てより先に Emacs キーマップを選択します。

`~/.zshenv` で `skip_global_compinit=1` を設定し、Ubuntu の `/etc/zsh/zshrc` による補完初期化を無効化します。補完の初期化は Zim に任せます。設定の再読み込みには `source ~/.zshrc` ではなく `exec zsh` を使ってください。

`~/.config/sheldon/plugins.toml` で `zimfw/environment` → `zimfw/completion` の順に読み込みます。両モジュールの既定値を採用し、履歴は `~/.zhistory` に保存します（メモリ内 20,000 件、保存 10,000 件）。独自の履歴設定と `history-all` は廃止します。旧 `~/.zsh_history` は自動で移行・削除しません。

モジュールの既定値には、自動 cd、`>` による既存ファイルの上書き禁止、大文字・小文字を区別しない glob なども含まれます。旧 `30-completion.zsh`・`40-history.zsh` は `.chezmoiremove` で配置先から削除し、設定の二重読み込みを防ぎます。

## mise・Sheldon の自動インストール（Linux・macOS）

`chezmoi apply` 時に、共通フックで mise を用意した後、mise 経由で Rust の stable ツールチェーンをインストールします。その Cargo で `cargo install sheldon --locked --root "$HOME/.local"` を実行し、Sheldon を `~/.local/bin/sheldon` に配置します。初回はネットワーク接続とビルド時間が必要です。

mise は PATH 上（`~/.local/bin` を含む）の既存インストールを利用し、見つからない場合のみ公式インストーラーで `~/.local/bin/mise` に導入します。`after_10-install-mise` → `after_20-install-sheldon` の順で実行します。

Ubuntu では、共通フックより先に apt 用フックで curl・ビルドツール・OpenSSL 開発ライブラリなどを導入します。他の Linux ではこれらの依存を、macOS では Command Line Tools などのビルド環境を事前に用意してください。Windows ネイティブでは、この2つの共通フックは実行しません。

Ubuntu 用フックは `apt-get` を使用し、指定パッケージを導入します。追加リポジトリがある場合のみ `software-properties-common` を導入し、リポジトリをまとめて追加してからパッケージ一覧を再更新します。システム全体の upgrade は別途行ってください。

Sheldon 用フックは、初回とスクリプト内容の変更時に実行されます。通常の apply では再ビルドしません。手動で更新する場合は次を実行します。

```sh
mise install rust@stable
mise exec rust@stable -- cargo install sheldon --locked --root "$HOME/.local"
```

プラグインは初回の Zsh 起動時に `sheldon source` が取得します。手動で更新する場合は `sheldon lock --update` を実行します。

## Linux・macOS の sudo 事前認証

Linux・macOS では `apply`・`init`・`update` のソース状態を読み込む前に `sudo -v` を実行します。external の取得より先に認証し、その後の sudo を使う処理で認証キャッシュを利用します。認証に失敗すると処理を中断します。長時間の処理でキャッシュが期限切れになった場合は、再度認証が必要です。Windows ネイティブではこのフックを設定しません。

設定済みの PC でこのフックを有効にするには、変更を取得した後に `chezmoi init` で設定ファイルを再生成してください。`diff`・`status` では認証しませんが、`apply --dry-run` でもフックは実行されます。
