require 'devise'

class ProfileController < ApplicationController

  def index
  end

  def search
    email = params[:email]
    @user_to_follow = User.find_by(email: email)
  end

  def show_profile
  end
end
