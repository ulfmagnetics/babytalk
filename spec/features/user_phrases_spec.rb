require 'spec_helper'

feature "user phrase interaction" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:p1) { FactoryGirl.create(:phrase, user: user, content: 'Eggy weggs') }
  let!(:p2) { FactoryGirl.create(:phrase, user: user, content: 'Look, daddy!') }

  before do

  end

  scenario "viewing profile page" do
    login_as user
    visit user_path(user)
    expect(page).to have_text(p1.content)
    expect(page).to have_text(p2.content)
  end
end
