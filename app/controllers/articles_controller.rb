class ArticlesController < ApplicationController
  
  # Perform this action (set_article) before these actions:
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  # Renders the "new article" form, which will them submit to the create route:
  def new
    # We need to initiate an empty @article instance var because we have
    # the errors check on @article in the view!
    # If we don't we get an error for trying to check the value of a var that
    # does not exist!
    @article = Article.new
  end


  # Saves the article in the DB:
  def create
    # render plain: params[:article].inspect
    # or
    # render plain: params[:article]
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was successfully created"
      # Not sure why 'article_path':
      # It's because the path is 'article'
      # > rails routes 
      # Prefix  Verb   URI Pattern              Controller#Action
      # article GET    /articles/:id(.:format)  articles#show
      # ^^^^^^^
      # article is prefix, '_path' needs to be added to the prefix
      # to use/redirect to that path!

      #redirect_to article_path(@article)

      # There's a shortcut now:
      redirect_to @article

    else
      render 'new'
    end

  end

  def show
    # '@' makes article an instance var...
    # thus making it available in the view
    # we were doing the set article here - now moved to before_action!
  end

  def edit
  end

  def update
    
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  
    # Whitelist parameters:
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end