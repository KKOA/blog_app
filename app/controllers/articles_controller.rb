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
      flash[:success] = 'Article has been created'
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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Article has been updated'
      redirect_to @article
    else
      flash.now[:danger] = 'Article has not been updated'
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if  @article.destroy
      flash[:success] = 'Article has been Deleted'
      redirect_to articles_path
    end
  end

  protected

  def rescourse_not_found
    message = 'The article you are looking for could not be found'
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def article_params
    # whitelist article fields
    params.require(:article).permit(:title, :body)
  end
end
