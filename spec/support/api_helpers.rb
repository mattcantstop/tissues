module ApiHelper
  include Rack::Test::Methods
end

RSpec.configure do |c|
  c.include ApiHelper, :type => :request
end
