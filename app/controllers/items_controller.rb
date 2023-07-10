class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  
  def index

    

     @items = Item.all.order("created_at DESC")

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

  def show
    
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
   
  
  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end  

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
   
  end


  

  

   private
   def item_params
          params.require(:item).permit(:name,:category_id,:image, :condition_id, :charge_id, :prefecture_id, :days_ship_id, :price, :explanation).merge(user_id: current_user.id)
   end

   def set_item
     @item = Item.find(params[:id])
   end
end


