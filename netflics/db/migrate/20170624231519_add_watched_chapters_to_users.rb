class AddWatchedChaptersToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :watchedchapters, :string

  end
end
