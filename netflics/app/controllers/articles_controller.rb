class ArticlesController < ApplicationController
	before_action :find_article, only: [:edit, :update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)
		if current_user.blank?
	       redirect_to new_article_path, :alert => "ERROR: Debe estar ingresado"
	    else
			@article.user_id = current_user.id
			if @article.save
					redirect_to action: "index"
			else
				render 'new'
			end
		end
	end

	def index
		@articles = Article.all
  	end

	def edit
	end

	def update

		if @article.update(articles_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to @article
	end

	private

		def articles_params
			params.require(:article).permit(:content, :title, :tag)
		end

		def find_article
			@article = Article.find(params[:id])
		end

end
