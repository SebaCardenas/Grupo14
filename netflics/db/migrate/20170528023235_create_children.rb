class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.integer :user_id
      t.string :role
      t.string :name
      t.boolean :state

      t.timestamps
    end
  end
end
