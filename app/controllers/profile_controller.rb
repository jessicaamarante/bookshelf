require 'devise'

class ProfileController < ApplicationController

  def index
    if params[:email].present?
      @friends = User.where(email: params[:email])
    else
      @friends = []
    end
  end

  def search
  end
end
