class FatherCommentsController < ApplicationController
  def create
    @father_comment = FatherComment.new(father_comment_params)
    if @father_comment.valid?
      @father_comment.save
    else
      render json: { meta: { code: 422, error_message: @father_comment.errors.messages } },
             status: 422
    end
  end

  def destroy
    @father_comment = FatherComment.find(params[:id])
    if Time.now - @father_comment.publish_at < 24 * 60 * 60
      @father_comment.destroy
    else
      render json: { meta: { code: 422, error_message: '只可删除当天评论' } },
             status: 422
    end
  end

  private

  def father_comment_params
    params.require(:father_comment).permit(:article_id, :content, :user_id, :confirm, :publish_at)
  end
end
