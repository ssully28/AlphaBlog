class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    # @article gets passed over to the view (new.html.erb)
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was successfully created"
      # Not sure why 'article_path':
      redirect_to article_path(@article)
    else
      render 'new'
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
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end


  private
    # Whitelist parameters:
    def article_params
      params.require(:article).permit(:title, :description)
    end


end