class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :string
      t.text :description
      t.string :author

      t.timestamps null: false
    end
  end
end
