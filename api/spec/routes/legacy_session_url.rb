require 'rails_helper'

describe "Routing", :type => :routing do
  it 'supports legacy url' do
    expect(:post => "/api/v1/user_session").to route_to(:controller => "auth_token")
  end
end
