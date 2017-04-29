class RenameAuthorDirector < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :author, :director
  end
end
