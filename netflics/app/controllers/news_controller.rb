class NewsController < ApplicationController
	
	before_action :find_new, only: [:edit, :update, :destroy]

	def new
		@new = New.new
	end

	def create
		@new = New.new(new_params)
		@new.user_id = current_user.id

		if @new.save
			redirect_to @new
		else
			render 'new'
		end
	end

	def index
		@news = New.all
  	end

	def edit
	end

	def update

		if @new.update(new_params)
			redirect_to @new
		else
			render 'edit'
		end
	end

	def destroy
		@new.destroy
		redirect_to @new
	end

	private

		def new_params
			params.require(:new).permit(:content)
		end

		def find_new
			@new = Review.find(params[:id])
		end

end
