# dotfiles 向け Copilot Instructions

## 目的
- このリポジトリは、Ansible の role を使って Linux/macOS の開発用 dotfiles を管理します。
- 既存の構成と命名を維持しつつ、小さくレビューしやすい変更を優先してください。

## リポジトリ規約
- メインのエントリーポイントは `site.yml` です。
- role の構成は `roles/<role_name>/` 配下です。
- role の task エントリーポイントは `roles/<role_name>/tasks/main.yml` です。
- ローカル静的ファイルは通常 `roles/<role_name>/files/` または `roles/<role_name>/local_files/` に配置します。
- シェルスクリプトは、明示的な bash 依存がない限り POSIX 互換を意識してください。

## 編集時の方針
- 明示的な依頼がない限り、既存 role 名や task ファイル名は変更しないでください。
- 既存 YAML のインデント・スタイルに合わせてください。
- Ansible の task は冪等性（idempotent）を優先してください。
- ファイルを追加する場合は、最も適切で具体的な既存 role 配下に配置してください。
- 重い新規依存の導入は避けてください。
- `README.md` には Copilot に関連する説明や運用ルールを記載しないでください。

## 検証チェックリスト
- 可能であれば次を実行してください:
  - `ansible-playbook --syntax-check site.yml`
- role 変更時は、task のパスや template/file の参照が有効か確認してください。
- shell 更新時は、非対話実行を壊さないようにしてください。

## PR/コミット時の出力スタイル
- 変更内容は日本語で要約してください。
- 影響のある role / ファイルパスを明確に記載してください。
- 手動確認した手順があれば記載してください。
