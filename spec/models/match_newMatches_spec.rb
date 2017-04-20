require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "newMatches" do
    let!(:student) { create :user }
    let!(:another_student) { create :user }

    it "returns array of matches for all students" do
      expect(Match.newMatches[0]).to include(student)
      expect(Match.newMatches[0]).to include(another_student)
    end
  end

end
