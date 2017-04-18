class AddMatchesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :match_1, :integer
    add_column :users, :match_2, :integer
  end
end
