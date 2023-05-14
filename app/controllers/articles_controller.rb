class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.build(article_params)
    @article.upload_image(params[:article][:image])
    if @article.save
      flash[:success] = '試合結果を登録しました。'
      redirect_to @article
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @article.destroy
    flash[:success] = "記事を削除しました。"
    redirect_to articles_url
  end
  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end
    def set_article
      @article = Article.find(params[:id])
    end
end
