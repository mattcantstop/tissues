require 'spec_helper'

feature "hidden links" do
  let!(:user)  { FactoryGirl.create(:user) }
  let!(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:project) { FactoryGirl.create(:project) }

  context "anonymous user" do
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Delete Project"
    end
  end

  context "reqular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end
     scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Delete Project"
    end 
  end

  context "admin users" do
  def authorize_admin!
    require_signin!

    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
    before { sign_in_as!(admin_user) }
    scenario "can see the New Project link" do
      sign_in_as!(admin_user)
      visit '/'
      assert_link_for "New Project"
    end
  end
end
