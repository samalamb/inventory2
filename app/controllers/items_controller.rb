class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @item = Item.new
  end

  def create
    @item = Item.new

    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.brand = params[:item][:brand]
    @topic = Topic.find(params[:topic_id])

    @item.topic = @topic

    if @item.save
      flash[:notice] = "Your item was successfully added to your inventory"
      redirect_to [@topic, @item]
    else
      flash.now[:alert] = "Sorry something went wrong, please try again."
      render(:new)
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.brand = params[:item][:brand]

    if @item.save
      flash[:notice] = "Your item was successfully added to your inventory"
      redirect_to([@item.topic, @item])
    else
      flash.now[:alert] = "Sorry something went wrong, please try again."
      render(:edit)
    end
  end

  def destroy
     @item = Item.find(params[:id])

 # #8
     if @item.destroy
       flash[:notice] = "\"#{@item.name}\" was deleted successfully."
       redirect_to @item.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

  private


  def item_params
    params.require(:item).permit(:name, :description, :brand)
  end
end
