FactoryGirl.define do
  factory :match do
    day         { Faker::Date.between(Date.today.beginning_of_week(), Date.today) }
    student_1   { build(:user) }
    student_2   { build(:user) }
  end
end
