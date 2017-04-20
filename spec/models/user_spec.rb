require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let!(:existing_user) { create :user, name: "oscar" }

    it "is invalid without a name" do
      user = User.new(name: "")
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "is invalid without a unique name" do
      user = User.new(name: "oscar")
      user.valid?
      expect(user.errors).to have_key(:name)
    end
  end
end
