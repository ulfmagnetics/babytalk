require 'spec_helper'

feature "A User who interacts with phrases" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:p1) { FactoryGirl.create(:phrase, user: user, content: 'Eggy weggs') }
  let!(:p2) { FactoryGirl.create(:phrase, user: user, content: 'Look, daddy!') }

  before do
    login_as user
  end

  scenario "viewing profile page" do
    visit user_path(user)
    expect(page).to have_text(p1.content)
    expect(page).to have_text(p2.content)
  end

  pending "adding a phrase with invalid information", :js => true do
    visit user_path(user)
    click_button "Add" # blank form
    expect(page).to have_text('error')
  end

  scenario "adding a phrase with valid information", :js => true do
    content = 'My brush teeth'
    visit user_path(user)
    fill_in "New phrase...", :with => content
    click_button "Add"
    expect(page).to have_xpath("//ol/li[text()='#{content}']")
  end
end
