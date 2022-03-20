class UserLikesController < ApplicationController
  before_action :set_father_comment
  def like
    @user_like = UserLike.find_by(like_params)
    if @user_like.nil?
      @user_like = @father_comment.user_likes.create(like_params)
    else
      @user_like.destroy
    end
  end

  def status
    @user_like = @father_comment.user_likesrLike.find_by(like_params)
    if @user_like.nil?
      render json: { status: false }
    else
      render json: { status: true }
    end
  end

  private

  def like_params
    params.permit(:user_id)
  end

  def set_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id])
  end
end
