class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	

	def index
	    @movies = Movie.all
	    respond_to do |format|
	      format.html
	      format.csv { send_data @movies.to_csv(current_user), filename: "users-#{Date.today}.csv" }
	    end
	end




end
