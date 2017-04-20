require 'rails_helper'

describe "Admin user viewing matches list" do
  before { login_as admin }

  let(:admin) { create :user, admin: true }
  let(:student) { create :user }
  let(:student2) { create :user }
  let(:student3) { create :user }
  let(:student4) { create :user }

  let!(:match) { create :match, student_1: student, student_2: student2 }
  let!(:match2) { create :match, student_1: student3, student_2: student2 }
  let!(:match3) { create :match, student_1: student, student_2: student4 }

  it "shows all matches" do
    visit matches_url
    expect(page).to have_text("#{student.name} - #{student2.name}")
    expect(page).to have_text("#{student3.name} - #{student2.name}")
    expect(page).to have_text("#{student.name} - #{student4.name}")
  end

end
