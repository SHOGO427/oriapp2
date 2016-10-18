class UsersController < ApplicationController
  def show
      @user = current_user
      @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  end
end
