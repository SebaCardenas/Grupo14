class ChangeFinishYearTypeInMovies < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :finish_year, :date
  end
end
