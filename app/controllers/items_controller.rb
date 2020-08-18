class ItemsController < ApplicationController
  def index
  end

  def show
    @comment = Coment.new
  end

  def new
    @item = saler_user.items.bulid
  end

  def create
    @item = saler_user.items.bulid(item_params)
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