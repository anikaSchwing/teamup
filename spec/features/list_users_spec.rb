require 'rails_helper'

describe "Admin user viewing users list" do
  before { login_as admin }

  let(:admin) { create :user, admin: true }
  let!(:student) { create :user }
  let!(:student2) { create :user }
  let!(:student3) { create :user }
  let!(:student4) { create :user }

  it "shows all users" do
    visit admin_users_url
    expect(page).to have_text(student.name)
    expect(page).to have_text(student2.name)
    expect(page).to have_text(student3.name)
    expect(page).to have_text(student4.name)
  end

  it "doesn't show current user" do
    visit admin_users_url
    expect(page).not_to have_text("#{admin.name} (admin)")
  end

end
