class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :country
      t.string :language
      t.text :actor
      t.string :director
      t.integer :n_chapter
      t.integer :n_season
      t.integer :start_year
      t.integer :finish_year
      t.datetime :date_update

      t.timestamps
    end
  end
end
