User.delete_all
puts "Deleted all the users"

User.create!(name: "grover", email: "admin@b.com", password: "testing", admin: true)
User.create!(name: "cookie monster", email: "admin2@b.com", password: "testing", admin: true)
student1 = User.create!(name: "bert", email: "student@b.com", password: "testing", admin: false)
student2 = User.create!(name: "ernie", email: "student2@b.com", password: "testing", admin: false)
student3 = User.create!(name: "big bird", email: "student3@b.com", password: "testing", admin: false)
student4 = User.create!(name: "miss piggy", email: "student4@b.com", password: "testing", admin: false)
student5 = User.create!(name: "count von count", email: "student5@b.com", password: "testing", admin: false)
student6 = User.create!(name: "elmo", email: "student6@b.com", password: "testing", admin: false)
puts "Created new users"

Match.create!(day: "2017-04-03T00:00:00+00:00", student_1: student1, student_2: student2)
Match.create!(day: "2017-05-03T00:00:00+00:00", student_1: student1, student_2: student3)
Match.create!(day: "2017-05-03T00:00:00+00:00", student_1: student1, student_2: student2)
puts "Created matches"
