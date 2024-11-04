require 'devise'

class ProfileController < ApplicationController

  def index
    if params[:email].present?
      @friends = User.where(email: params[:email])
    else
      @friends = []
    end
  end

  def follow
    friend = Profile.find(params[:id])
    @friend_followed = current_user.follow(friend)
  end
end
