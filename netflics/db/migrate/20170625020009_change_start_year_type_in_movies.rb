class ChangeStartYearTypeInMovies < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :start_year, :date
  end
end
