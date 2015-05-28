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

end
