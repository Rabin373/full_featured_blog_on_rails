class ArticlesController < ApplicationController

def new
  @article =Article.new
end

def create
  debugger
  @article = Article.new(article_params)
  @article.user = User.first
  if @article.save
  	flash[:success] = "Article was sucessfully created"
	redirect_to @article
  else
	render 'new'
  end
end

def edit
  @article = Article.find(params[:id])
end

def update
  debugger
  @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:success] = "sucessfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end


def show
    @article = Article.find(params[:id])
  end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:danger] = "The article was sucessfully destroyed! "
  redirect_to articles_path
end

def index
	@articles = Article.all
end


 
private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end