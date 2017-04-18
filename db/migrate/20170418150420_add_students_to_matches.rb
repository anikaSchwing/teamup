class AddStudentsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :student_1, :integer
    add_column :matches, :student_2, :integer
  end
end
