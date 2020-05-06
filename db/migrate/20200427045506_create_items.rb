# userテーブルに基づくitemのitemテーブル:userに紐づいた商品の情報を表示させるために作成
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # itemテーブルの構造:itemの名前、値段、user_id(ログインユーザーのデータと紐付けるカラム)
      t.string :name
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
