class ArticlesController < ApplicationController
	def new
		@user = User.find(current_user)
   		@article = @user.articles.build(params[:article])
	end

	def create
		@user = User.find(current_user)
   		@article = @user.articles.create(params[:article])
   		redirect_to articles_path

	end

	def index
		@user = User.find(current_user)
		@articles = @user.articles.all
    @search = Article.search do
      fulltext params[:search]
    end
    @articles = @search.results
	end

	def edit
		@user = User.find(current_user)
		@article = @user.articles.find(params[:id])
	end

	def update
		@user = User.find(current_user)		
		@cc=@user.articles.find(params[:id])
		@cc.update_attributes(params[:article])
		redirect_to articles_path
	end 


	def show

		
		@article = Article.find(params[:id])
		@user = User.find(@article.user_id)
		
	end

	def destroy
		@user = User.find(current_user)
		@user.articles.find(params[:id]).destroy
		redirect_to articles_path
	end


end
