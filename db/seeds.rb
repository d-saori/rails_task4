# サンプルとなるデータを登録し、アプリの動作の確認をしやすくする
# Active Recordのメソッドと一緒。Itemテーブルのcreateメソッドを使う。
# user_id:全て1だが、これから新しくアプリでデータを投稿する時は、ログインユーザーのidに応じて2、3、4〜という風に番号が振られるようになる
# create!とするとdbにseedデータ登録時にエラーがあった場合エラーメッセージを表示する
Item.create!(name: "熱狂のWebマーケティング", price: "1500", user_id: 1)
Item.create!(name: "0秒シンキング", price: "1200", user_id: 1)
Item.create!(name: "死ぬこと以外、けっこう平気。", price: "1300 ", user_id: 1)