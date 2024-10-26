require 'devise'

class ProfileController < ApplicationController

  def index
    if params[:email].present?
      friends = User.where(email: params[:email])
    end
  end

  def search
  end
end
