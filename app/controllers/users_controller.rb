class UsersController < ApplicationController
  def show
    @user = current_user
    # @addable_friends = @user.addable_users
  end

  private
end
