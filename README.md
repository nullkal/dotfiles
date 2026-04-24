nullkal/dotfiles: ぬるかるの個人用CLI環境設定リポジトリ
----

このリポジトリには、nullkal(ぬるかる)が個人的に使用しているCLI環境の設定スクリプトが置かれています。
設定スクリプトの管理にはAnsibleを使用しています。

このリポジトリの内容は自由に参考にして構いません。

## セットアップ方法

```cmd
$ git clone https://github.com/nullkal/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./scripts/bootstrap
$ ./scripts/setup-priv
```

## 使い方

### 環境を最新にする

```cmd
$ git pull
$ ./scripts/update-priv
$ ansible-playbook site.yml --ask-become-pass
```
