class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dash_boards]
  def dash_boards
    @user = current_user
  end
end
