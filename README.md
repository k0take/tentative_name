## サービス概要
　最近出費が多いという人に
　最安値を記録することによって、日々の買い物で節約できるようにする
　買い物手助けサービスです


## メインのターゲットユーザー
　主婦
　出費を抑えたい人


## ユーザーが抱える課題
　今まで通りの買い物をしても物価の高騰によって、会計が以前より数千円高くなってしまう
　店舗によって値段が全く違う


## 解決方法
　最安値を記録していくことで、日々の買い物で節約できるようになる
　店舗ごとの値段がわかるようになることで一目で値段差がわかるようになる
　

## 実装予定の機能
　ログイン機能
　　ゲストログイン
　　LINEログイン

　登録機能
　　通常価格、特別価格が登録できる
　　店舗名の登録ができる
　　登録情報の編集
　　登録情報の削除
　　登録した日付（自動的に登録される）

　タグ機能
　　区分を登録できる（野菜、お菓子・・等）

　一覧機能
　　税抜、税別どちらで表示するか選べる
　　並べ替え
　　　五十音順に並べ替えられる（デフォルト設定）
　　　種類順に並べ替えられる
　　　価格順に並べ替えられる
　　　店舗順に並べ替えられる
　　　登録順に並べ替えられる

　詳細機能
　　商品名
　　店舗名
　　価格
　　登録日
　　メモ

　検索機能
　　商品名の検索
　　タグの検索
　　店舗名の検索
　　価格での検索（200~300等）

　リスト機能
　　登録情報からリストに追加することで買い物リストとして使える
　　リストの編集
　　リストの削除
　　リストの共有機能（ログインユーザーのみ）
　　
　ログインユーザー
　　LINEを使ってリストの共有ができる


## なぜこのサービスを作りたいのか？
　レジ業務中、お客様の声で「買いすぎた」等耳にすることが多くなってきている。
　自分自身の買い物でも「この商品は向こうの店の方が安かったっけ？」と値段が気になることが多いため、その場でパッと調べられるものが欲しいと思ったから。


## スケジュール
　企画〜技術調査：12/4〆切
　README〜ER図作成：12/10 〆切
　メイン機能実装：12/10 - 1/15
　β版をRUNTEQ内リリース（MVP）：1/16〆切
　本番リリース：1月末


## 画面遷移図
[Figma](https://www.figma.com/file/gwugEzurjjBQAIWf0kCBZU/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1&t=cc1SMXXuOzXViNFs-1)


## ER図
[ER図](https://gyazo.com/2bd1cc1f654733cae31f8c363b822bbd)