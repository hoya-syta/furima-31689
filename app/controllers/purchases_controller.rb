class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new
  end
 
  def new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new(address_params)   
     if @address_purchase.valid?
       pay_item
       @address_purchase.save
       redirect_to root_path
     else
       render :index
     end
  end
 
  private
  def address_params
   params.require(:address_purchase).permit(:postal_code, :prefectures_id, :municipalities, :address, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  
    Payjp::Charge.create(
      amount: @item.price,  
      card: address_params[:token],    
      currency: 'jpy' 
    )
  end
end
