class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @item = Item.new
    @item = Item.find_by(params[:id])
  end

  def new
  end

  def create
    @orders = Orders.create(orders_params)
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(
      :postal_code,
      :prefecture_id,
      :municipalities,
      :address,
      :building_name,
      :telephone_number
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

end
