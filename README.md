# AutoReconnect

指定のネットワークアダプタがネットワークから切断された際に再起動するスクリプト

![image](https://github.com/nsd-working-g1/auto-reconnect/assets/46245666/cfabbdbf-5eb5-4b59-95f5-e57527dfef89)

## Usage

```powershell
.\AutoReconnect.ps1 -AdapterName "Wi-Fi 2" -Interval 60
```

- `AdapterName` にはネットワークアダプタ名を指定
- `Interval` にはチェック間隔を秒で指定

## Memo

### ネットワークアダプタ名を調べる（Windows11）

1. 設定 > ネットワークとインターネット > ネットワークの詳細設定を開く
2. 「ネットワークアダプター」のリストの各アイテムの上段のテキストを確認する

![image](https://github.com/user-attachments/assets/cbe8d752-5160-4774-aeda-dd0b5e68ebe8)

### タスクスケジューラに設定する（Windows11）\

1. タスクスケジューラを起動する
2. 「タスクの作成」をクリック
3. 全般タブで設定する
  1. 任意の名前を指定する
  2. セキュリティオプションの「ユーザがログオンしているかどうかにかかわらず実行する(W)」を選択
  3. セキュリティオプションの「最上位の特権で実行する」にチェックを入れる
7. トリガータブで設定する
  1. 新規をクリックする
  2. タスクの開始で「スタートアップ時」を選択する
  3. 詳細設定の「有効」にチェックを入れる
  4. OK をクリックする
8. 操作タブで設定する
  1. 操作で「プログラムの開始」を選択する
  2. 設定のプログラム/スクリプトに PowerShell の実行ファイルを指定する
  3. 引数の追加に `-executionpolicy bypass -file "path\to\auto-reconnect\AutoReconnect.ps1" -AdapterName "Wi-Fi 2" -Interval 60` を指定
9. そのほか任意の設定を済ませたら OK をクリック
