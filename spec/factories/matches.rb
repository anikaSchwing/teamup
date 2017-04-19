FactoryGirl.define do
  factory :match do
    day         { Faker::Date.between(10.days.ago, Date.today) }
    student_1   { build(:user) }
    student_2   { build(:user) }
  end
end
