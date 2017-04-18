class Match < ApplicationRecord
  belongs_to :student_1, :class_name => 'User', :foreign_key => 'student_1'
  belongs_to :student_2, :class_name => 'User', :foreign_key => 'student_2'
end
