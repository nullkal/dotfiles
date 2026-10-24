# nullkal/dotfiles: ぬるかるの個人用CLI環境設定

[chezmoi](https://github.com/twpayne/chezmoi) で管理している個人用の dotfiles です。自由に参考にして構いません。

## セットアップ

Linux・macOS 向けです。Ubuntu では apt、macOS では Homebrew Bundle で必要なパッケージを自動インストールします。macOS では Command Line Tools（`xcode-select --install`）を事前に用意してください。Homebrew がなければセットアップ中に導入します。他の Linux では Git・curl・Zsh・tmux・Neovim・C/C++ ビルドツール・pkg-config・OpenSSL 開発ライブラリを事前に用意してください。

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply nullkal
```

実行中にユーザー情報や sudo パスワードの入力を求められます。初回はツールのダウンロードとビルドに時間がかかります。完了後は Zsh を起動してください。

```sh
zsh
```

## 設定の更新・反映

```sh
# リポジトリの最新変更を取得して反映
chezmoi update

# ローカルで編集した設定の差分を確認して反映
chezmoi diff
chezmoi apply

# Zsh を再起動
exec zsh
```

chezmoi 自体の設定テンプレートを変更した場合は、`chezmoi init` で設定を再生成してください。

## ツール・プラグインの更新

```sh
# Zsh プラグイン
sheldon lock --update

# fzf・Starship・GitHub CLI
mise upgrade fzf starship gh

# Sheldon
mise install rust@stable
mise exec rust@stable -- cargo install sheldon --locked --root "$HOME/.local"
```

プラグイン更新後は `exec zsh` で Zsh を再起動してください。OS のパッケージ更新は別途行ってください。

chezmoi・mise・GitHub CLI の Zsh 補完は、初回起動時に `${XDG_DATA_HOME:-$HOME/.local/share}/zsh/site-functions` へ生成します。以降は配置済みの補完を `fpath` と Zim の `compinit` で読み込みます。実行ファイルの場所・更新時刻などが変わった場合は、次の Zsh 起動時に再生成します。コマンド更新後は `exec zsh` で反映してください。
