class ApplicationController < ActionController::Base
  def show
   @article = Article.find(params[:id])
 end

  def new
  end

  def create
    render plain: params[:article].inspect
  end
end
