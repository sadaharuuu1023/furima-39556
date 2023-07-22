class OrdersController < ApplicationController

  def index
    @order = DonationAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
  end


  def create
    @order = DonationAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  

  #def order_params
    #params.require(:order).permit(:price).merge(user_id: current_user.id)
  #end
  #データベースに保存されないときに試す
  private
  def order_params
  params.require(:donation_address).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])##, token:params[:token])
  end

end

