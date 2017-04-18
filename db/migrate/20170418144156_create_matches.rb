class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.datetime :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
