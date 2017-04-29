class AddCreatorToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :creator, :integer
  end
end
