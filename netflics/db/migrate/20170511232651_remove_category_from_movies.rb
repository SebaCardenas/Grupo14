class RemoveCategoryFromMovies < ActiveRecord::Migration[5.0]
  def up
    remove_column :movies, :category, :string
  end

  def down
    add_column :movies, :category, :string
  end
end
