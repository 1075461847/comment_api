class SonCommentsController < ApplicationController
  def create
    @son_comment = SonComment.new(son_comment_params)
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

  def son_comment_params
    params.require(:son_comment).permit(:article_id, :content, :father_comment_id, :user_id, :confirm, :publish_at,
                                        :reply_user_id)
  end
end
