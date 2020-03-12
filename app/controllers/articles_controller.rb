class ArticlesController < ApplicationController

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


  private
    def article_params
      params.require(:article).permit(:title, :description)
    end


end