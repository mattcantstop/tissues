require 'spec_helper'

describe "/api/v1/tickets", :type => :request do
  let!(:user)  { FactoryGirl.create(:user) }

  before do
    user.permissions.create!(:action => "view",
                             :thing => project)
  end

  let(:token) { user.authentication_token }

  context "index" do
    before do
      5.times do
        FactoryGirl.create(:ticket, :project => project, :user => user)
      end
    end

    let!(:project) { FactoryGirl.create(:project, :name => "Ticketee") }
binding.pry
    let(:url) { "/api/v1/projects/#{project.id}/tickets" }

    it "XML" do
      get "#{url}.xml", :token => token
      last_response.body.should eql(project.tickets.to_xml)
    end

    it "JSON" do
      get "#{url}.json", :token => token
      last_response.body.should eql(project.tickets.to_json)
    end
  end
end
