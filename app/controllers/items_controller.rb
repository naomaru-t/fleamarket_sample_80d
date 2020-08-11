class ItemsController < ApplicationController
  def index
  end

  def new
      @category_parent_array = Category.where(ancestry: nil)
  
    def get_category_children
      @category_children = Category.find("#{params[:parent_id]}").children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end 
  end

end