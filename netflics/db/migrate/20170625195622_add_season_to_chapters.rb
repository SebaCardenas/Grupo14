class AddSeasonToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :season, :integer
  end
end
