class OrdersController < ApplicationController
  before_action :set_public_key
  before_action :authenticate_user!
  before_action :set_orders
  before_action :move_to_index

  def index
    if @item.order.present?
      return redirect_to root_path
    end
    @order = DonationAddress.new
  end


  def create
    @order = DonationAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:donation_address).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def set_public_key
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    end

    def set_orders
      @item = Item.find(params[:item_id])
    end

    def move_to_index
      if current_user.id == @item.user_id
        redirect_to items_path
      end
    end
end

