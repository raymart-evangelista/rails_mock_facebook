class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :toggle_add_friend]
  before_action :authenticate_user!
  def show
    # binding.pry
    @user = User.find_by(username: params[:username])
  end

  # def toggle_add_friend
  #   # binding.pry
  #   # get the user to add
  #   @person = User.find(params[:id])
  #   # create a sent request in FreindRequest
  #   FriendRequest.create!(requestor_id: @user.id, receiver_id: @person.id)
  #   # redirect, page should show that the Friend request was sent
  #   redirect_to user_url(@user.username), notice: "Friend request sent."
  # end

  private

  # def set_user
  #   @user = current_user
  # end
end
