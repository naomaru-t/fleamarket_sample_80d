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
    
end