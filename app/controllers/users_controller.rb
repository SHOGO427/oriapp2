class UsersController < ApplicationController
  def show
      @user = current_user
      @tweets = current_user.tweets.order("created_at DESC")
  end

  private
  def user_params
    params.require(:user).permit(:name, :description, :image)
  end
end
