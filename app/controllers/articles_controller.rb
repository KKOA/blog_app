class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:sucess] = 'Article has been created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not been created'
      # stop error message being displayed on the next page request
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    # whitelist article fields
    params.require(:article).permit(:title, :body)
  end
end
