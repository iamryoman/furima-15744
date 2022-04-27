class ItemsController < ApplicationController
  def index
    # @articles = Article.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:aitem).permit(:title,:text,:genre_id)
  end
end
