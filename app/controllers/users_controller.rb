class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def index
    @user = User.all
  end
end
