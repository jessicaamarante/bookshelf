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
    friend = User.find(params[:id])
    @friend_followed = current_user.follow(friend)
  end
end
