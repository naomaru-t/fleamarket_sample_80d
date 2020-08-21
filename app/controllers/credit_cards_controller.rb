class CreditCardsController < ApplicationController
  before_action :move_to_root
  before_action :set_card , only: [:show, :destroy, :buy, :pay]
  before_action :set_item , only: [:buy, :pay]

  require "payjp"


  def new
    @card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(current_user.id) if @card.exists?
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

  def show    
    if @card.blank?
      redirect_to action: "new"
    else  
      # credentials.yml.encのAPI秘密鍵の呼び出し
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      # Pay.jpに登録されているカスタマー情報を引き出す
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # カスタマー情報からカードの情報を引き出す
      @customer_card = customer.cards.retrieve(@card.card_id)


      @card_brand = @customer_card.brand 
      case @card_brand 
      when "Visa"
        @card_src = "visa300px.gif"
      when "MasterCard"
        @card_src = "master300px.gif"
      when "American Express"
        @card_src = "amex300px.gif"
      when "Diners Club"
        @card_src = "diners300px.gif"
      end
      
      # viewの記述を簡略化
      @exp_month = @customer_card.exp_month.to_s
      @exp_year = @customer_card.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    if @card.blank? 
      redirect_to action: "new"
    else  
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

      customer = Payjp::Customer.retrieve(@card.customer_id)

      customer.delete
      @card.delete 

      if @card.destroy 
        # 削除完了ならdestroyのビューに移行
      else 
        redirect_to credit_card_path(current_uer.id), alert: "削除できませんでした。"
      end 
    end
  end

  def buy
    if user_signed_in?
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      if @card.blank?
        @card_info = ""
      else  
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @card_info = customer.cards.retrieve(@card.card_id)
        case @card_info.brand 
          when  "Visa"
            @card_src = "visa300px.gif"
          when  "JCB"
            @card_src = "jcb300px.gif"
          when  "MasterCard"
            @card_src = "master300px.gif"
          when  "American Express"
            @card_src = "amex300px.gif"
          when  "Diners Club"
            @card_src = "diners300px.gif"
        end
      end 
    else  
      redirect_to root_path 
    end
  end

  def pay
    if @item.sellstatus_id == 2
      redirect_to buy_credit_card_path(@item)
    else 
      @item.with_lock do
        if current_user.credit_card.present?
          Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
          charge = Payjp::Charge.create(
            amount: @item.price,
            customer: Payjp::Customer.retrieve(@card.customer_id),
            currency: 'jpy'
          )
          @item.update!(sellstatus_id: 2)
          @item.update!(buyer_id: current_user.id)
        else  
          Payjp::Charge.create(
            amount: @item.price,
            card: params['payjp-token'],
            currency: 'jpy'
          )
          @item.update!(sellstatus_id: 2)
          @item.update!(buyer_id: current_user.id)
        end
      end
    end
  end

  private
  def move_to_root
    redirect_to root_path unless user_signed_in?
  end 

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      redirect_to root_path 
    end
  end

end
