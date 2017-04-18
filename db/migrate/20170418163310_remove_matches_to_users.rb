class RemoveMatchesToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :match_1, :integer
    remove_column :users, :match_2, :integer
  end
end
