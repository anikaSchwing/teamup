require 'rails_helper'

RSpec.describe Match, type: :model do

  describe "createMatches" do
    let!(:student5) { create :user }
    let!(:student6) { create :user }

    it "creates new matches" do
      Match.getMatches()
      expect{Match.createMatches(Date.today)}.to change(Match, :count).by(1)
    end
  end

end
