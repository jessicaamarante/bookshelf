require 'devise'

class ProfileController < ApplicationController

  def index
    if params[:email].present?
      @friends = User.where(email: params[:email])
      @following = @friends.select { |friend| current_user.user_friendships.exists?(friend_id: friend.id) }
    else
      @friends = []
      @following = []
    end
  end

  def follow
    friend = Profile.find(params[:id])
    @friend_followed = current_user.follow(friend)
  end
end
