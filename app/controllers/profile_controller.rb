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
    current_user.follow(friend)
    redirect_to profile_path, notice: "You are now following #{friend.email}"
  end
end
