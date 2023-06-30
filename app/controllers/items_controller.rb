class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.includes(:user)
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
          params.require(:item).permit(:name,:category_id,:image, :condition_id, :charge_id, :prefecture_id, :days_ship_id, :price, :explanation).merge(user_id: current_user.id)
   end


  
end


# @items = Item.order("created_at DESC")
# before_action :authenticate_user!,