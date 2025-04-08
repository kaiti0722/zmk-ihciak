# IHCIAK Keyboard

Xiao BLEマイクロコントローラーとPMW3360光学センサーを使用したカスタムキーボード/ポインティングデバイス。

## 特徴

- Seeeduino Xiao BLEマイクロコントローラーを使用
- PMW3360高精度光学センサー
- ZMKファームウェアでワイヤレス機能をサポート
- Bluetoothで接続可能
- リチウムポリマー電池で動作

## ハードウェア接続

### 電源接続:
- Xiao BLEの3.3VピンをPMW3360のVDDIOとVDDに接続
- Xiao BLEのGNDをPMW3360のGNDに接続

### SPI接続:
- Xiao BLEのSCK（D3）→ PMW3360のSCLK
- Xiao BLEのMOSI（D5）→ PMW3360のMOSI
- Xiao BLEのMISO（D4）→ PMW3360のMISO
- Xiao BLEのD6 → PMW3360のNCS（チップセレクト）
- Xiao BLEのD7 → PMW3360のMOT（動き検出）
- Xiao BLEのD8 → PMW3360のNRESET（リセット）

### バッテリー接続:
- リチウムポリマー電池の正極（+）→ Xiao BLEのLIPOピン
- リチウムポリマー電池の負極（-）→ Xiao BLEのGND

## ファームウェア

このリポジトリには、ZMKビルドシステムを使用してIHCIAKキーボード用のファームウェアをビルドするために必要な設定ファイルが含まれています。

### ビルド方法

1. このリポジトリをフォークします
2. GitHub Actionsを使用して自動的にビルドするか、ローカルでZMK開発環境を設定してビルドします
3. 生成されたファームウェア（`ihciak-seeeduino_xiao_ble.uf2`）をダウンロードします
4. Xiao BLEをブートローダーモードにし、ファームウェアをコピーします

## トラブルシューティング

- **接続問題**: Bluetoothのペアリングをリセットするには、ボタンを押しながらデバイスをリセットします。
- **センサーが応答しない**: SPI接続を確認し、リセットピンを使用してセンサーをリセットしてください。
- **バッテリー寿命が短い**: 省電力設定を調整するか、バッテリー容量を増やしてください。

## カスタマイズ

独自のキーマップを作成するには、`config/boards/shields/ihciak/ihciak.keymap`ファイルを編集し、変更をコミットしてください。GitHub Actionsが自動的に新しいファームウェアをビルドします。

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。