class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.recent_reviews
  end
end
