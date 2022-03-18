class UserLikesController < ApplicationController
  before_action :set_father_comment
  def like
    @user_like = UserLike.find_by(like_params)
    if @user_like.nil?
      @user_like = UserLike.create(like_params)
      @father_comment.like_count += 1
    else
      @user_like.destroy
      @father_comment.like_count -= 1
    end
    @father_comment.save
  end

  def like?
    @user_like = UserLike.find_by(like_params)
    if @user_like.nil?
      render json: { is_like: false }
    else
      render json: { is_like: true }
    end
  end

  private

  def like_params
    params.permit(:user_id, :father_comment_id)
  end

  def set_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id])
  end
end
