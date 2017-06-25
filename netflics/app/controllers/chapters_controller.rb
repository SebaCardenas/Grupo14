class ChaptersController < ApplicationController
  before_action :find_movie
  before_action :find_chapter, only: [:edit, :update, :destroy]
  def index

  end

  def show
    @chapter = Chapter.find(params[:id])
  end
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to movie_chapters_path
  end

  def new
    @chapter = Chapter.new
#    @movie =  Movie.find(params[:movie_id])
#    @chapter = @movie.chapters.build
    #@movie = Movie.find(params[:movie])
  end

  def edit
    @chapter = Chapter.find(params[:id])
    render 'edit'
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update_attributes(chapter_params)
    redirect_to movies_path
  end

  def create

    @chapter = Chapter.new(chapter_params)
    @chapter.movie_id = @movie.id
    @movie.chapter_id = @chapter.id

    if @chapter.duration.blank?
      redirect_to new_movie_path, :alert => "ERROR: Debe agregar la duración del capitulo"

    elsif @chapter.duration < 0
      redirect_to new_movie_path, :alert => "ERROR: La duración tiene que ser mayor a 0"

    if @chapter.save
        redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end


  private
    def find_movie
      @movie = Movie.find(params[:movie_id])
    end
    def find_chapter
			@chapter = Chapter.find(params[:id])
		end
    def chapter_params
      params.require(:chapter).permit(:title, :duration, :movie_id)
    end
end
