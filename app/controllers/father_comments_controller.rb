class FatherCommentsController < ApplicationController
  def with_user
    @comments = {}
    @comments[:father_comments] = User.find(params[:user_id]).father_comments.order(publish_data: :desc)
  end

  def destroy
    @father_comment = FatherComment.find(params[:id])
    if Time.now - @father_comment.publish_data < 86_400
      @father_comment.destroy
    else
      render json: { meta: { code: 422, error_message: '只可删除当天评论' } },
             status: 422
    end
  end

  def need_verify
    @comments = {}
    @comments[:father_comments] = FatherComment.not_verify
  end

  def with_article
    @comments = {}
    @comments[:father_comments] = FatherComment.with_article params[:article_id]
  end
end
