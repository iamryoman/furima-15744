class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :move_to_index, only: [:edit]
  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    item_find
  end

  def edit
    item_find
  end

  def update
    item_find
    @item.update(item_params)

    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :item_description,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :prefecture_id,
      :days_to_ship_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
