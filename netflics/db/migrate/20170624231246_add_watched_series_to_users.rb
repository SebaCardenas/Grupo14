class AddWatchedSeriesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :watchedseries, :string

  end
end
