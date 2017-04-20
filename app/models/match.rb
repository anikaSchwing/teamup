class Match < ApplicationRecord
  belongs_to :student_1, :class_name => 'User'
  belongs_to :student_2, :class_name => 'User'

  validates :day, :student_1, :student_2, presence: true

  def self.getMatches
    previous_matches = Array.new
    all.each do |match|
      previous_matches << [match.student_1, match.student_2]
    end
    return previous_matches
  end
end
