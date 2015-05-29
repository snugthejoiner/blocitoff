class UsersController < ApplicationController

  def show
    @user = current_user
    @items = @user.items.where(completed: false)
    @completed_items = @user.items.where(completed: true)
  end

end
