# AutoReconnect

指定のネットワークアダプタがネットワークから切断された際に再起動するスクリプト

## Usage

```powershell
.\AutoReconnect.ps1 -AdapterName "Wi-Fi 2" -Interval 10
```

- `AdapterName` にはネットワークアダプタ名を指定
- `Interval` にはチェック間隔を秒で指定

## Memo

### ネットワークアダプタ名を調べる

Windows 11 の場合

1. 設定 > ネットワークとインターネット > ネットワークの詳細設定を開く
1. 「ネットワークアダプター」のリストの各アイテムの上段のテキストを確認する
