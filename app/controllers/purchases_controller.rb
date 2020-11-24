class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)

    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render action: :index and return
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end 

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.value,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end  

end