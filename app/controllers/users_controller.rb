class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :toggle_add_friend]
  before_action :authenticate_user!
  def show
    # binding.pry
    # @user = User.find_by(username: params[:username])
    @user = User.friendly.find(params[:username])
  end

  def send_friend_request
    # binding.pry
    # get the person to add
    @person = User.friendly.find(params[:id])
    # create a sent request in FreindRequest
    FriendRequest.create!(requestor_id: current_user.id, receiver_id: @person.id)
    # redirect, page should show that the Friend request was sent
    redirect_to user_url(current_user.username), notice: "Friend request sent."
  end
  
  def cancel_friend_request
    # binding.pry
    # get the person who the current_user wants to cancel request
    @person = User.friendly.find(params[:id])
    FriendRequest.destroy_by(requestor_id: current_user.id, receiver_id: @person.id)
    redirect_to user_url(current_user.username), notice: "Friend request cancelled."
  end

  private

  # def set_user
  #   @user = current_user
  # end
end
