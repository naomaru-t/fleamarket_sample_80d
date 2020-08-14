class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    # @item.user_id = current_user.id　ログイン機能が実装してから
    if @item.save!
      item = Item.find(@item.id)
      redirect_to root_path, notice: 'アイテムが保存された'
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
