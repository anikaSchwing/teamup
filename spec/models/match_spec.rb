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


end
