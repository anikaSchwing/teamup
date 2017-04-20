require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "newMatches" do
    let!(:student7) { create :user }
    let!(:student8) { create :user }

    it "returns array of matches for all students" do
      expect(Match.newMatches.last).to include(student7)
      expect(Match.newMatches.last).to include(student8)
      puts Match.newMatches.length
    end
  end

end
