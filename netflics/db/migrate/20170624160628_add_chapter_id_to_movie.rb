class AddChapterIdToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :chapter_id, :integer
  end
end
