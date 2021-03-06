class Match < ApplicationRecord
  belongs_to :student_1, :class_name => 'User'
  belongs_to :student_2, :class_name => 'User'

  validates :day, :student_1, :student_2, presence: true

  @all_students = User.where(admin:false)

  def self.getMatches
    @previous_matches = Array.new
    all.each do |match|
      @previous_matches << [match.student_1, match.student_2]
    end
    return @previous_matches
  end

  def self.newMatches
    new_matches = []
    current_set = Array.new(@all_students).shuffle()

    while current_set.length > 1 do
      first_student = current_set.shift()
      second_student = current_set.shift()

      new_matches << [first_student, second_student]
    end
    return new_matches
  end

  def self.existingMatch(new_matches)
    existing_match = false
    new_matches.each do |match|
      match = Array.new(match)
      if (@previous_matches.include?(match) || @previous_matches.include?(match.reverse))
        existing_match = true
      end
    end
    return existing_match
  end

  def self.createMatches(day)
    new_matches = newMatches()
    possible_matches = (@all_students.length-1) * (@all_students.length/2)

    if(existingMatch(new_matches) && (@previous_matches.length < possible_matches))
      createMatches(day)
    else
      new_matches.each do |students|
        Match.create(day: day, student_1: students[0], student_2: students[1])
      end
    end
  end

end
