# society score
URL https://society-score.com/

### サイトテーマ
管理者（自分）が作った楽譜をPDFもしくはpngファイルとしてアップロードし、
購入するとそ楽譜がダウンロードできるようになるECサイト。

### テーマを選んだ理由
未だ紙媒体での製造・販売が多い楽譜においては、自分の好きな曲を探すのが難しかったり、
楽譜集として単品で購入できなかったりする。そこで当サイトでは、1曲ごとにファイルで
ダウンロードできるようにすることで、店に行く・楽譜を探す手間を省く。
PDFもしくはpngファイルのため、誰の手にも触られない安全なものであり、拡大縮小や
印刷も容易である。また、他の楽譜サイトのように、「自分の探している曲が見つからない」
といった問題に対応すべく、リクエストフォームを作り、会員の声にもこたえてアップロード
していく。

### ターゲットユーザ
- 音楽が好きな人
- 楽譜を探している人
- 他サイトや書店で希望する楽譜を見つけられなかった人

### 主な利用シーン
- 楽譜を探したいとき及びダウンロードするとき
- 楽譜をリクエストしたいとき

## 設計書
- ER図 https://app.diagrams.net/#G1RSCTsC75rK-lfxUeRWmCMSpUj0C3C3jb
- テーブル定義書 https://docs.google.com/spreadsheets/d/1grXDO2We9J0PXNAhzfcf5pmc6bKRIt7SUzbQSePCT_Q/edit?usp=sharing
- 詳細設計 https://docs.google.com/spreadsheets/d/1P86eTuiubQFo9bRtwJTrnYbymKgzk0_aRgN_QO_t6Hs/edit?usp=sharing
- 実装機能リスト https://docs.google.com/spreadsheets/d/1oKnRn3_9zke1oy-ViBRIvCLz4-Q500xa2RJDAu1lnlU/edit?usp=sharing
- テスト仕様書 https://docs.google.com/spreadsheets/d/1jBBYehZ4vBZI7SoR_PfzDVgpvSdtaonN/edit?usp=sharing&ouid=101848054480528256844&rtpof=true&sd=true
- デプロイ手順チェックシート https://docs.google.com/spreadsheets/d/1xgGAWJO7UEf9xtwVftudRkTQc7HcVk-f3UbBAPW-Wbg/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
使用検討中です

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
- 欲しいものリスト機能
- 購入機能(購入手続き完了後、ダウンロード可能)
- ページネーション(kaminari)
- 検索機能
- リクエスト機能

## 注意
- 楽譜登録の際、ファイルは現状PDFファイルのみアップロード可能となっています。
- アップロードするファイルは「(楽譜名).pdfとなるように改名してください。