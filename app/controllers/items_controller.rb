class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = current_user.items.build(params.require(:item).permit(:name, :expires_at))
    @item.expires_at = Time.zone.now + 7.days
    if @item.save
      flash[:notice] = "Item was created."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    redirect_to @user
  end

  def destroy
     @user = current_user
     @item = Item.find(params[:id])

     if @item.destroy
       flash[:notice] = "Task was removed."
     else
       flash[:error] = "Task couldn't be deleted. Try again."
     end

     redirect_to @user
   end

  def complete
    @user = current_user
    @item = Item.find(params[:item_id])
    @item.update_attribute(:completed, true)
    if @item.save
      flash[:notice] = "Task Completed."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    redirect_to @user
  end

    def uncomplete
    @user = current_user
    @item = Item.find(params[:item_id])
    @item.update_attribute(:completed, false)
    if @item.save
      flash[:notice] = "Task Uncompleted."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    redirect_to @user
  end

end