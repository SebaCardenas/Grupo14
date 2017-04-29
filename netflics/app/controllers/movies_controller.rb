class MoviesController < ApplicationController
<<<<<<< HEAD
  load_and_authorize_resource
=======
>>>>>>> origin/development

  def index
      #@movies = Movie.all

  end

  def show
    #@movie = Movie.find(params[:id])
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
<<<<<<< HEAD
    #@movie.user_id = current_user.id
    # @movie = Movie.new(movie_params)
    #
     if @movie.save
       redirect_to @movie

     else
       render 'new'
     end
=======

    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie

    else
      render 'new'
    end
    puts @movie.title
    puts @movie.country
    puts @movie.description
>>>>>>> origin/development
  end

  private

<<<<<<< HEAD
     def movie_params
       params.require(:movie).permit(:title, :description, :director)
     end
=======
    def movie_params
      params.require(:movie).permit(:title, :description, :category, :country,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update)
    end

>>>>>>> origin/development
end
