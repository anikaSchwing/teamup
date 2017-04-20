require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "existingMatch" do
    let(:student) { create :user }
    let(:student2) { create :user }
    let(:student3) { create :user }
    let(:student4) { create :user }

    let!(:match) { create :match, student_1: student, student_2: student2 }
    let!(:match2) { create :match, student_1: student, student_2: student3 }

    it "returns false when matches are unique" do
      new_matches = [[student, student4]]
      Match.getMatches()
      expect(Match.existingMatch(new_matches)).to eq(false)
    end

    it "returns true when matches are repeated" do
      new_matches = [[student, student2]]
      Match.getMatches()
      expect(Match.existingMatch(new_matches)).to eq(true)
    end
  end

end
