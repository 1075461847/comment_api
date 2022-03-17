class ArticlesController < ApplicationController
  before_action :set_article, only: [:father_comments]
  before_action :set_father_comment, only: %i[son_comments all_son_comments]

  def father_comments
    @count = @article.father_comments.confirmed.count + @article.son_comments.confirmed.count
    @father_comments = @article.father_comments.confirmed.order(publish_at: :desc)
  end

  def son_comments
    @count = @father_comment.son_comments.confirmed.count
    @son_comments = @father_comment.son_comments.confirmed.order(publish_at: :desc)[0, 3]
  end

  def all_son_comments
    @son_comments = @father_comment.son_comments.confirmed.order(publish_at: :desc)
  end

  private

  def set_article
    @article = Article.find_by_id(params[:article_id])
  end

  def set_father_comment
    @father_comment = FatherComment.find_by_id(params[:father_comment_id])
  end
end
