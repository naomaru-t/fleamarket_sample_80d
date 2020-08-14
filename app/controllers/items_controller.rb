class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new

    @item = Item.new
    @item.images.new #-商品出品時に画像も同時に保存されるように記述
    @item.build_brand #-商品出品時にブランドも同時に保存されるように記述
    @category_parent_array = Category.where(ancestry: nil)
  
    def get_category_children
      @category_children = Category.find("#{params[:parent_id]}").children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end 
    
  end

  def create
    @item = Item.new(item_params)
    # @item.user_id = current_user.id　ログイン機能が実装してから
    if @item.save
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
    params.require(:item).permit(:name, :introduction, :sellstatus_id, :prefecture_id, :price, :condition_id, :postagepayer_id, :postagetype_id, :preparationdays_id, :category, :size, images_attributes: [:src, :_destroy, :id], brand_attributes: [:id, :_destroy, :name])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

