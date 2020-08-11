class ItemsController < ApplicationController
  def index
  end

  def new
    @category_parent_array = Category.where(ancestry: nil)
  end
  
end