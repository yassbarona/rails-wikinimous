class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def create
     @article = Article.new(article_params)
     @article.save
    redirect_to article_path(@article)
  end

  def edit
      set_article
  end

  def update
    set_article
    Article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    set_article
    @article.destroy
    redirect_to articles_path
  end

private
def set_article
  @article = Article.find(params[:id])
end

def article_params # strong params
    params.require(:article).permit(:title, :content)
  end

end
