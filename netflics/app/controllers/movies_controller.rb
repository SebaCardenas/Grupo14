class MoviesController < ApplicationController
  load_and_authorize_resource
  before_action :define_variables, only: [:index, :show]

  def hello
    @movie = Movie.find(params[:movie_id])
    to_find = current_user.watchedseries
    answer = ""
    if to_find.nil?
      answer = @movie.id.to_s + ','
    else
      answer = to_find.to_s + @movie.id.to_s + ','
    end

    current_user.update_attribute :watchedseries, answer

    redirect_to movie_path(@movie)
  end


  def index

    if params[:search]
      if @child_view.present?
        @movies = Movie.where(:category_id => "8").search(params[:search]).order("created_at DESC")
      else
        @movies = Movie.search(params[:search]).order("created_at DESC")
      end
    else
      if @child_view.present?
        if params[:order].blank?
          @movies = Movie.where(:category_id => "8")

        else
          @movies = Movie.where(:category_id => "8").order(params[:order])
        end

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
    @movie.creator = current_user.id
    @movie.category_id = params[:category_id]
    puts @movie.movie_img_file_name
     if @movie.movie_img_file_name.blank?
       redirect_to new_movie_path, :alert => "ERROR: Debe agregar una imagen"

     elsif @movie.n_chapter.blank? || @movie.n_chapter <= 0
       redirect_to new_movie_path, :alert => "ERROR: Número de capitulos debe ser mayor a 1"

     elsif @movie.n_season.blank? ||@movie.n_season <= 0
       redirect_to new_movie_path, :alert => "ERROR: Número de temporadas debe ser mayor a 1"

     elsif @movie.start_year.blank?
       redirect_to new_movie_path, :alert => "ERROR: Debe ingresar un año de inicio"

     elsif !@movie.finish_year.nil?
      if @movie.start_year > @movie.finish_year
        redirect_to new_movie_path, :alert => "ERROR: El año no puede ser mayor que el año de inicio"
      end
     else

      if @movie.save
        redirect_to @movie

      else
        render '_form'
      end
    end


  end

  def define_variables
    if current_user.present?


      @child = current_user.children.find_by(name: params[:child])
      @child2 = current_user.children

      if @child.present?
        @child_view_id = @child.id
        @child_view = Child.find(@child_view_id)

        @child_view.state = true
        @child_view.save

      else
        @child2.each do |c2|

          if c2.state?
            @child_view_id = c2.id
            @child_view = Child.find(@child_view_id)

          end
        end
      end
    else
      User.all.each do |u|
        if u.children.present?
          u.children.each do |uc|
            uc.state = false
            uc.save
          end
        end
      end
    end
  end

  private


    def movie_params
      params.require(:movie).permit( :title, :description, :country,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update, :creator, :category_id, :movie_img, :chapter_id)
    end

end
