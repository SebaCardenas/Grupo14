class ChaptersController < ApplicationController
  before_action :find_movie
  before_action :find_chapter, only: [:edit, :update, :destroy]

  def bye
    @chapter = Chapter.find(params[:chapter_id])
    to_find = current_user.watchedchapters
    answer = ""
    puts "hOALASOIAJSAJSLAKJSLAKSJAKLSJLAKSJAJKSKJLSKLSJKL"
    if to_find.nil?
      answer = @chapter.id.to_s + ','
    else
      answer = to_find.to_s + @chapter.id.to_s + ','
    end

    current_user.update_attribute :watchedchapters, answer

    redirect_to movie_chapters_path
  end



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
    puts "------------------------------------------------------------------"
    puts @movie
    puts :movie
    @chapter.movie_id = @movie.id
    @movie.chapter_id = @chapter.id

    puts "aca estoy--------------------------"
    puts chapter_params[0]
    puts chapter_params[1]
    puts @movie.id
    puts @chapter.movie_id
    puts @movie.chapter_id
    puts @chapter.id
    puts "aca estoy--------------------------2"


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
