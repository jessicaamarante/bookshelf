require 'devise'

class ProfileController < ApplicationController

  def index
    if params[:email].present?
      friends = User.find_by(email: params[:email])
      @friends = friends.email
    end

  end

  def search
  end
end
