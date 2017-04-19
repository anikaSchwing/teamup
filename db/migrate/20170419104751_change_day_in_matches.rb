class ChangeDayInMatches < ActiveRecord::Migration[5.0]
  def change
    change_column :matches, :day, :date
  end
end
