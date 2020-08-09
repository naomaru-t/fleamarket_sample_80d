class ItemsController < ApplicationController
  def index
  end

  def show
    @comment = Coment.new
  end

end