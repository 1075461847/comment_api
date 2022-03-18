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
    @comments[:father_comments] = @user.father_comments.confirmed.order(publish_at: :desc)
    @comments[:son_comments] = @user.son_comments.confirmed.order(publish_at: :desc)
  end

  def destroy_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id]).destroy
  end

  def destroy_son_comment
    @son_comment = SonComment.find_by_id(params[:son_comment_id]).destroy
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
