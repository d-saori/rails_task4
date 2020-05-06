class UsersController < ApplicationController
  def show
    # Itemテーブルを検索しているのはitemsコントローラーと変わらないが、この中でcurrent_userを使いidを調べている。
    # 購入したユーザーのidに紐付いてその商品が検索される
    # where:条件指定
    # user_idというカラムがcurrent_userのidと同じものを検索してくる
    # @items = Item.where(user_id: current_user.id)

    # UsersコントローラーなのにItemモデルに対する記述を書いていて、それに対して検索をかけているのが違和感があるので下記のように修正
    # アソシエーションでmodels/concerns/item.rbにbelongs_to、models/concerns/user.rbにhas_manyの記述を書いてあるので、userを遡ってuserに関するitemの情報を取得できるようになっている
    # itemの情報を取得せず、userの情報だけを取得する記述でOK
    @user = User.find(current_user.id)
  end
end
