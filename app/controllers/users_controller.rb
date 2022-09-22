class UsersController < ApplicationController
  def show
    @user = current_user

    # @addable_friends = @user.addable_users
  end

  def toggle_add_friend
  end
  private
end
