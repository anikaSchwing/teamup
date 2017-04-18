User.delete_all
puts "Deleted all the users"

User.create!(email: "admin@b.com", password: "testing", admin: true)
User.create!(email: "student@b.com", password: "testing", admin: false)
puts "Created new users"
