class CreditCardsController < ApplicationController
  require "payjp"


  def new 
  end 

  def create 
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした"
    else  
      # トークン作成された場合のアクション
      # 生成したトークンから、顧客情報と紐付け、PAY.JP管理サイトに登録
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )
      # トークン化した情報をCredit_cardsテーブルに登録
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      # トークン作成とともにcredit_cardsテーブルに登録された場合、createビューが表示されるように条件分岐
      if @card.save 
        # createビューを作成しない場合はビューを指定
      else  
        redirect_to action: "create"
      end
    end
  end
  
end
