class SonCommentsController < ApplicationController
  before_action :set_father_comment
  def index
    @soncomments = @father_comment.son_comments
  end

  def create
    @son_comment = @father_comment.son_comments.new(son_comment_params)
    if @son_comment.valid?
      @son_comment.save
    else
      render json: { meta: { code: 422, error_message: @son_comment.errors.messages } },
             status: 422
    end
  end

  def destroy
    @son_comment = SonComment.find(params[:id])
    if Time.now - @son_comment.publish_at < 24 * 60 * 60
      @son_comment.destroy
    else
      render json: { meta: { code: 422, error_message: '只可删除当天评论' } },
             status: 422
    end
  end

  private

  def set_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id])
  end

  def son_comment_params
    params.require(:son_comment).permit(:content, :user_id, :confirm, :publish_at, :reply_user_id)
  end
end
