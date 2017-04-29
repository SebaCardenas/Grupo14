class SeriesController < ApplicationController

  def index
    if user_signed_in?
      @series = Serie.all
    else
      redirect_to "/login"
    end

  end

  def show
    @serie = Serie.find(params[:id])
  end

  def edit
    @serie = Serie.find(params[:id])
    render 'edit'
  end

  def destroy
    @serie = Serie.find(params[:id])
    @serie.destroy

    redirect_to series_path

  end

  def new
    @serie = Serie.new
  end

  def create

    @serie = Serie.new(serie_params)

    if @serie.save
      redirect_to @serie

    else
      render 'new'
    end
  end

  private

    def serie_params
      params.require(:serie).permit(:title, :description, :category,
      :language, :actor, :director, :n_chapter, :n_season, :start_year,
      :finish_year, :date_update)
    end

end
