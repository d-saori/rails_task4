class ItemsController < ApplicationController
  # 直接URLを指定してnewアクションやcreateアクションに遷移されると困るので、ログインしているユーザーのみがviewにアクセスできるようする
  # 『except: :index』:index以外のアクションが実行される以外は、その前にmove_to_indexが実行される
  # indexアクションはユーザーの状態(サインインの有無)に関わらず表示はできる
  # 『before_action』:indexアクション以外のアクションの時だけ動作する
  before_action :move_to_index, except: :index

  def index
    # Itemの全てのレコードを取得してitemsというインスタンス変数に格納
    # 全てのレコードを取得するので@itemsと複数形にする
    @items = Item.all
  end

  def new
    # 格納されるのは新規のデータ、1つだけなので@itemと単数形にする
    @item = Item.new
  end

  def create
    # crrent_user:現在ログインしているユーザー(deviceを導入しているため使える)
    Item.create(name: item_params[:name], price: item_params[:price], user_id: current_user.id)
  end

  def move_to_index
    # ユーザーがサインインしていない場合は、indexアクションにredirect(強制的にindexアクションが実行される。indexページに飛ばされる)させる
    redirect_to action: :index unless user_signed_in?
  end

  # itemの名前と値段に関しては、ユーザーが登録するデータなのでストロングパラメーターなので、実際に投入するデータというのを制限する
  private

  def item_params
    # form_forに紐付いたデータ(@itemのハッシュの中にnameとpriceの中にハッシュが付いてくる)
    params.require(:item).permit(:name, :price)
  end
end