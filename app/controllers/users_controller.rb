class UsersController < ApplicationController
  before_action :set_user, only: [:tweets, :edit, :update, :likes, :followings, :followers]
  def tweets
    @tweets = @user.tweets
  end

  def edit
    unless @user == current_user
      redirect_to root_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to tweets_user_path(@user)
  end

  def followings
    @followings = @user.followings.all # @followings 基於測試規格，必須講定變數名稱
  end

  def followers
    @followers = @user.followers.all# @followers基於測試規格，必須講定變數名稱
  end

  def likes
    @likes = @user.liked_tweets # @likes基於測試規格，必須講定變數名稱
  end

private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end
