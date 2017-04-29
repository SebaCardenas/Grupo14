class MoviesController < ApplicationController
  load_and_authorize_resource


  def index
      #@movies = Movie.all

  end

  def show
    #@movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    redirect_to @movie
  end
 
  def edit
    #@movie = Movie.find(params[:id])
    render 'edit'
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path

  end

  def new
    #@movie = Movie.new
  end

  def create

    #@movie.user_id = current_user.id
    # @movie = Movie.new(movie_params)
    #
     if @movie.save
       redirect_to @movie

     else
       render 'new'
     end



  end

  private


    def movie_params
      params.require(:movie).permit(:title, :description, :category, :country,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update)
    end

end
