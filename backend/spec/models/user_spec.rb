require 'spec_helper'
require 'rails_helper'

describe User do
  let!(:existing_user) { User.create(email: 'user@test.com', password: 'testpassword') }

  describe "self.authenticate" do
    it "returns user when exist" do
      user = User.authenticate('user@test.com', 'testpassword')
      expect(user).to eq(existing_user)
    end
    it "returns nil when user doesn't exist" do
      user = User.authenticate('user@noexist.com', 'test')
      expect(user).to be_nil
    end
  end
end
