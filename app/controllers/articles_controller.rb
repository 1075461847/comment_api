class ArticlesController < ApplicationController
  before_action :set_article
  before_action :set_father_comment, only: %i[son_comments all_son_comments create_son_comment]

  def father_comments
    @count = @article.father_comments.confirmed.count + @article.son_comments.confirmed.count
    @father_comments = @article.father_comments.confirmed.order(publish_at: :desc)
  end

  def create_father_comment
    @father_comment = @article.father_comments.new(father_comment_params)
    if @father_comment.valid?
      @father_comment.save
    else
      render json: { meta: { code: 422, error_message: @father_comment.errors.messages } },
             status: 422
    end
  end

  def son_comments
    @count = @father_comment.son_comments.confirmed.count
    @son_comments = @father_comment.son_comments.confirmed.order(publish_at: :desc)[0, 3]
  end

  def all_son_comments
    @son_comments = @father_comment.son_comments.confirmed.order(publish_at: :desc)
  end

  def create_son_comment
    @son_comment = @father_comment.son_comments.new(son_comment_params)
    if @son_comment.valid?
      @son_comment.save
    else
      render json: { meta: { code: 422, error_message: @son_comment.errors.messages } },
             status: 422
    end
  end

  private

  def set_article
    @article = Article.find_by_id(params[:article_id])
  end

  def set_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id])
  end

  def father_comment_params
    params.require(:father_comment).permit(:content, :user_id, :confirm, :publish_at)
  end

  def son_comment_params
    params.require(:son_comment).permit(:article_id, :content, :user_id, :confirm, :publish_at,
                                        :reply_user_id)
  end
end
