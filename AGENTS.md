# Repository Guidelines

## 応答言語

このプロジェクトでは、原則として日本語で応答してください。説明や作業報告も日本語で記述し、ユーザーが別の言語を指定した場合はその指示に従ってください。コマンド、ファイル名、コードの識別子は元の表記を維持してください。

## プロジェクト構成

このリポジトリは chezmoi で個人用の dotfiles を管理します。`.chezmoiroot` で指定した `home/` 内の `dot_*` はホームディレクトリのドットファイルに対応します。例えば、`home/dot_config/git/config.tmpl` の配置先は `~/.config/git/config` です。`.tmpl` ファイルには chezmoi の Go テンプレートを使用します。

- `home/dot_config/nvim/`: LazyVim 設定。起動時の設定は `lua/config/`、プラグイン定義は `lua/plugins/` に配置します。
- `home/dot_zshrc`: `~/.config/zsh/zshrc/*.zsh` をファイル名順に自動で読み込みます。用途別の設定は `home/dot_config/zsh/zshrc/` に置き、番号付きのファイル名で順序を指定します。
- `home/dot_config/sheldon/plugins.toml`: Zsh プラグインの一覧と読み込み順を管理します。環境・履歴・ユーティリティ・補完設定には Zim モジュールの既定値を使います。
- `home/.chezmoiremove`: 廃止した設定ファイルを配置先から削除します。
- `home/.chezmoi.yaml.tmpl`: chezmoi の設定テンプレートです。Linux・macOS ではソース状態の読み込み前に sudo 認証を行うフックを設定します。変更を既存環境へ反映するには `chezmoi init` が必要です。
- `home/.chezmoidata/packages.yaml`: インストール用テンプレートで参照する Ubuntu のパッケージとリポジトリの一覧です。
- `home/run_onchange_ubuntu-install-packages.sh.tmpl`: Ubuntu 専用のパッケージインストールフックです。
- `home/run_onchange_after_10-install-mise.sh.tmpl`: Linux・macOS 共通の mise 導入フックです。
- `home/dot_config/mise/conf.d/fzf.toml`: mise で管理する fzf のバージョン指定です。
- `home/dot_config/mise/conf.d/starship.toml`: mise で管理する Starship のバージョン指定です。
- `home/dot_config/starship.toml`: 1行の左プロンプトと右側の時刻表示を設定します。
- `home/run_onchange_after_40-install-starship.sh.tmpl`: Linux・macOS 共通の Starship 導入フックです。
- `home/run_onchange_after_30-install-fzf.sh.tmpl`: Linux・macOS 共通の fzf 導入フックです。
- `home/run_onchange_after_20-install-sheldon.sh.tmpl`: mise 導入後に、mise 管理の Rust/Cargo で Sheldon をビルドします（Linux・macOS）。
- `home/.chezmoiexternal.toml`: tmux プラグインマネージャーなど、外部依存の定義です。
- `.chezmoiroot`: chezmoi の管理対象の起点として `home/` を指定します。
- `README.md` と `AGENTS.md` はリポジトリルートに置き、配置対象には含めません。

アプリケーションのビルド、専用テストスイート、アセット用ディレクトリはありません。古いコミットには Ansible 構成が含まれますが、変更は現在の chezmoi 構成に合わせてください。

## 開発・検証コマンド

chezmoi をインストールし、このディレクトリをソースとして使用する設定で実行してください。

- `chezmoi status`: 管理対象ファイルと配置先の差分状況を確認します。
- `chezmoi diff`: 適用前に、テンプレート展開後の差分を確認します。
- `chezmoi apply --dry-run --verbose`: 実際に適用せず、実行予定の処理を確認します。
- `chezmoi apply`: ローカル環境に変更を適用します。Ubuntu のフックは管理者権限でリポジトリの追加と指定パッケージのインストールを行うため、事前に内容を確認してください。
- `stylua --check home/dot_config/nvim`: 同梱の設定に従って Lua の書式を検証します。

## コーディング規約と命名

chezmoi の命名プレフィックスと `.tmpl` 拡張子を維持してください。OS 固有の処理にはテンプレートの条件分岐を使用します。Lua と YAML のインデントはスペース 2 個です。Lua は `home/dot_config/nvim/stylua.toml` に従い、行幅の上限を 120 桁とします。Neovim の設定は該当する設定モジュールへ、プラグイン定義は `lua/plugins/` へ追加してください。

## テスト方針

自動テストのフレームワークやカバレッジ基準は未設定です。テンプレートの変更は対象 OS 上で chezmoi のプレビューを確認してください。適用後は、Zsh の起動、tmux 設定の再読み込み、Neovim の起動と `:checkhealth` など、変更したツールの動作を確認します。プルリクエストには検証結果を記載してください。

## コミットとプルリクエスト

履歴では、簡潔に変更内容を示す件名が使われています。`chore(vscode): ...` や `nvim: ...` のようなスコープ付きの形式があり、日本語と英語の両方が使われています。コミットは変更目的ごとにまとめてください。プルリクエストには、対象ツール、動作の変更、前提 OS、検証内容を記載します。関連 Issue があればリンクし、表示の変更には必要に応じてスクリーンショットを添付してください。

## セキュリティと設定管理

認証情報、トークン、非公開のマシン固有設定はコミットしないでください。展開後の差分を共有する前に、機密情報が含まれていないか確認します。プラグインのロックファイルや既存のステージ済み変更には、作業と無関係な編集を加えないでください。
