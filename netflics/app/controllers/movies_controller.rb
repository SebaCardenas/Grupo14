class MoviesController < ApplicationController

  def index
    if user_signed_in?
      @movies = Movie.all
    else
      redirect_to "/login"
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    render 'edit'
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path

  end

  def new
    @movie = Movie.new
  end

  def create

    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie

    else
      render 'new'
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :description, :category,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update)
    end

end
