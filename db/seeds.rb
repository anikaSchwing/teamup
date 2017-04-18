User.delete_all
puts "Deleted all the users"

User.create!(email: "admin@b.com", password: "testing", admin: true)
User.create!(email: "student@b.com", password: "testing", admin: false)
User.create!(email: "student2@b.com", password: "testing", admin: false)
puts "Created new users"

Match.create!(day: "2017-04-03T00:00:00+00:00", student_1: 1 , student_2: 0)
puts "Created matches"
