require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "getMatches" do
    let(:student) { create :user }
    let(:another_student) { create :user }
    let!(:match1) { create :match, student_1: student, student_2: another_student }
    let!(:match2) { create :match, student_1: another_student, student_2: student }

    it "returns array of all student pairs" do
      expect(Match.getMatches).to match_array [[student, another_student], [another_student, student]]
    end
  end

end
