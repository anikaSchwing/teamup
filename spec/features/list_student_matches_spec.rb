require 'rails_helper'

describe "Current student viewing matches list" do
  before { login_as student }

  let(:student) { create :user }
  let(:student2) { create :user }
  let(:student3) { create :user }
  let(:student4) { create :user }

  let!(:match) { create :match, student_1: student, student_2: student2 }
  let!(:match2) { create :match, student_1: student3, student_2: student2 }
  let!(:match3) { create :match, student_1: student, student_2: student4 }
  let!(:match_late) { create :match, day: Date.tomorrow, student_1: student }

  it "shows all students matches" do
    visit matches_url
    expect(page).to have_text("You are matched with #{student2.name}")
    expect(page).to have_text("You are matched with #{student4.name}")
  end

  it "does not show other students matches" do
    visit matches_url
    expect(page).not_to have_text("You are matched with #{student3.name}")
  end

  it "does not show matches after today" do
    visit matches_url
    expect(page).not_to have_text(Date.tomorrow.to_s)
  end
end
