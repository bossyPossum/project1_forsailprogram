class ArticlesController < ApplicationController
    before_action :show, only: [:edit, :update, :show, :destroy]


def index
    @articles = Article.all
end


def show
    @article = Article.find(params[:id])
end

def new
    @article = Article.new
end

def edit
    @article = Article.find(params[:id])
end

def create
    @article = Article.new(article_params)
 
    if @article.save
      flash[:notice] = "Your article was successfully created"
      redirect_to @article
    else
      render 'new'
    end
end

def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      flash[:notice] = "Your article was updated"
      redirect_to @article
    else
      flash[:notice] = "Your article was not updated"  
      render 'edit'
    end
  end


def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
