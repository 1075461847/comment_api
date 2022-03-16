class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy comments]
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
    else
      render json: { meta: { code: 422, error_message: @user.errors.messages } },
             status: 422
    end
  end

  def destroy
    @user.destroy
  end

  def comments
    @comments = {}
    User.find(params[:user_id]).father_comment
  end

  private

  def set_user
    @user = User.find_by_id params[:user_id].to_i
    @user ||= {}
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
