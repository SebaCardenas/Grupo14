class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :string
      t.text :description
      t.string :director

      t.timestamps null: false
    end
  end
end
