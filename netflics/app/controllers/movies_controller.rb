class MoviesController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC")
    else
      if params[:category].blank?
        if params[:order].blank?
          #@movies = Movie.all
        else
          @movies = Movie.all.order(params[:order])
        end
      else
        @category_id = Category.find_by(name: params[:category]).id
        @movies = Movie.where(:category_id => @category_id)
      end
    end
  end

  def show
    #@movie = Movie.find(params[:id])
    if @movie.reviews.blank?
      @average_review = 0
    else
      @average_review = @movie.reviews.average(:rating).round(2)
    end

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
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create

    #@movie.user_id = current_user.id
    #@movie = Movie.new(movie_params)
    @movie.category_id = params[:category_id]
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n"
    puts @movie.movie_img_file_name
     if @movie.movie_img_file_name.blank?
       redirect_to new_movie_path, :alert => "ERROR: Debe agregar una imagen"
     else

      if @movie.save
        redirect_to @movie

      else
        render 'new'
      end
    end


  end

  private


    def movie_params
      params.require(:movie).permit( :title, :description, :country,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update, :creator, :category_id, :movie_img)
    end

end
