class UsersController < ApplicationController
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
    User.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
