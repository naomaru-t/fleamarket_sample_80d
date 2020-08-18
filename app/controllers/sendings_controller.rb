# class SendingsController < ApplicationController
#   def new
#     @sending = Sending.new
#   end
#   def create
#     @sending = Sending.new(sending_params)
#     if @sending.save
#       redirect_to root_path
#     else
#       render :new
#     end
#   end
#   private
#     def sending_params
#       params.require(:sending).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :post_code, :city, :house_number, :building_name).merge(user_id: current_user.id)
#     end
# end
