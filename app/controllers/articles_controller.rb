class ArticlesController < ApplicationController
  before_action :set_article

  def create
    Article.create
  end

  def show
    @count = @article.father_comments.confirmed.count
    @father_comments = @article.father_comments.confirmed.order(publish_at: :desc)
    @father_comments.each do |father_comment|
      @count += father_comment.son_comments.confirmed.count
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find_by_id(params[:id])
  end
end
