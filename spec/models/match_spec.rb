require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "association with students" do
    let(:student) { create :user }
    let(:another_student) { create :user }

    let(:match) { create :match, student_1: student, student_2: another_student }

    it "belongs to two students" do
      expect(match.student_1).to eq(student)
      expect(match.student_2).to eq(another_student)
    end
  end

  describe "validations" do
      it "is invalid without a date" do
        match = Match.new(day: "")
        match.valid?
        expect(match.errors).to have_key(:day)
      end

      it "is invalid without first student" do
        match = Match.new(student_1: nil)
        match.valid?
        expect(match.errors).to have_key(:student_1)
      end

      it "is invalid without second student" do
        match = Match.new(student_2: nil)
        match.valid?
        expect(match.errors).to have_key(:student_2)
      end
  end

end
