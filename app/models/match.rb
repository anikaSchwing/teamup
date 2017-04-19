class Match < ApplicationRecord
  belongs_to :student_1, :class_name => 'User'
  belongs_to :student_2, :class_name => 'User'

  def removeExistingMatches(day)
    todays_matches = Match.where(day: day)
    if(todays_matches.length > 0)
      todays_matches.each do |match|
        match.destroy
      end
    end
  end

  def matchStudents()
    matched_students = []
    all_students = User.where(admin:false)

    all_students.each do |student|
      if (!matched_students.flatten.include?(student))
        first_student = student
        second_student = findMatch(first_student, matched_students)

        matched_students << [first_student, second_student]
      end
    end

    return matched_students
  end

  def findMatch(first_student, matched_students)
    students = User.where(admin:false).where.not(id: first_student.id)
    second_student = students[rand(students.length)]
    previous_matches = second_student.match_1.length+second_student.match_2.length

    if (!matched_students.flatten.include?(second_student))
      return second_student
    else
      findMatch(first_student, matched_students)
    end
  end

  def createMatches(day)
    # other_days_matches = Match.where.not(day: day)
    #
    # @previous_matches = []
    # other_days_matches.each do |match|
    #   @previous_matches << [match.student_1, match.student_2]
    # end

    matched_students = matchStudents()

    matched_students.each do |students|
      new_match = Match.create(day: day, student_1: students[0], student_2: students[1])
    end

    redirect_to admin_matches_path, notice: "Matches created for #{day.to_date}"
  end
  
end
