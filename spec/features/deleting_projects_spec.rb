feature "Deleting Projects" do
  before do
    FactoryGirl.create(:project, name: "Textmate 2")
    visit '/'
    click_link "Textmate 2"
  end

  scenario "Deleting a project" do
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed.")
  end
end
