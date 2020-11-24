class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end

end