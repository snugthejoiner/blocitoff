class UsersController < ApplicationController

  def show
    @user = current_user
    @items = @user.items.where(completed: nil)
    @completed_items = @user.items.where(completed: true)
  end

end
