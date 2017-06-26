class AddMovieIdToChapter < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :movie_id, :integer
  end
end
