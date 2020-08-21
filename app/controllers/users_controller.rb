class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @items = @user.items
  end
end
