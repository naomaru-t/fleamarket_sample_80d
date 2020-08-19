class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(5)
    # 後に実装予定
    # @items = Item.includes(:images).order('created_at DESC').limit(5).where.not(condition: 1).where(condition: 0)
  end

  def new

    @item = Item.new
    @item.images.new #-商品出品時に画像も同時に保存されるように記述
    #@item.build_brand #-商品出品時にブランドも同時に保存されるように記述
      
    @category_parent_array = Category.where(ancestry: nil) #-カテゴリ親要素呼び出し
  end

    def get_category_children #-カテゴリ子要素呼び出し

      @category_children = Category.find("#{params[:parent_id]}").children
    end
  
    def get_category_grandchildren #-カテゴリ孫要素呼び出し
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end 

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save!

      item = Item.find(@item.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:saler_id, :name, :introduction, :sellstatus_id, :prefecture_id, :price, :condition_id, :postagepayer_id, :postagetype_id, :preparationdays_id, :category_id, :size, images_attributes: [:src, :_destroy, :id], brand_attributes: [:id, :_destroy, :name])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def show_all_instance
    @user = User.find(@item.user_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end
end

