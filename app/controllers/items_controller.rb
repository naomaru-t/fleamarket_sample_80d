class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
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

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :sellstatus_id, :prefecture_id, :price, :condition_id, :postagepayer_id, :postagetype_id, :preparationdays_id, :category, :size, brand_attributes: [:id, :name])
  end

end
