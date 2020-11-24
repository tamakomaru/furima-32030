class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)

  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end 

end