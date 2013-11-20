require 'spec_helper'

feature "hidden links" do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin_user) }

  context "anonymous user" do
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end
  end

  context "reqular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end
  end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Project link" do
      puts admin.inspect
      visit '/'
      assert_link_for "New Project"
    end
  end
end
