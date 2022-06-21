class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_by_item
  before_action :move_to_root_path, only: [:index]
  before_action :sold_out_move_to_root_path, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(
      :postal_code,
      :prefecture_id,
      :municipalities,
      :address,
      :building_name,
      :telephone_number
    ).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_move_to_root_path
    redirect_to root_path if @item.purchase_history.present?
  end

  def find_by_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
