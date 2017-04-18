class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :match_1, :class_name => 'Match', :foreign_key => 'student_1_id'
  has_many :match_2, :class_name => 'Match', :foreign_key => 'student_2_id'
end
