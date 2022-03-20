class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy show]
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

  def show
    @comments = {}
    @comments[:father_comments] = @user.father_comments.confirmed
    @comments[:son_comments] = @user.son_comments.confirmed
  end

  private

  def set_user
    @user = User.find_by_id params[:id]
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
