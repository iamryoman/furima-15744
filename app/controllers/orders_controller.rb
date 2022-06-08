class OrdersController < ApplicationController

  def index
    @orders = Orders.create(orders_params)
  end

  def new
  end

  def create
    @orders = Orders.create(orders_params)
    Address.create(address_params)
    redirect_to root_path
  end

end
