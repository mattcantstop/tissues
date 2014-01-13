require 'spec_helper'

feature 'Creating states' do
  let!(:admin_user) { FactoryGirl.create(:admin_user) }

  before do
    sign_in_as!(admin_user)
  end

  scenario "Creating a state" do
    click_link "Admin"
    click_link "States"
    click_link "New State"
    fill_in "Name", :with => "Duplicate"
    click_button "Create State"
    page.should have_content("State has been created.")
  end

end
