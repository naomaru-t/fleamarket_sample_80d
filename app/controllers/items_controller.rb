class ItemsController < ApplicationController

  def index
    @items = Item.includes(:item_images).order('created_at DESC').limit(5).where.not(condition: 1).where(condition: 0)

  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save

  end

  def create
  end
end
