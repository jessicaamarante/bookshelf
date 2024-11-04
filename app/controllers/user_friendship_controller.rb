class UserFriendshipController < ApplicationController
  before_action :authenticate_user!

  def show
    @friends = current_user.friends
  end
end
