require_relative '../app/api/authenticator'

describe Authenticator do

  describe ".authenticate_test_environment" do
    it "correctly sets token and auth password" do
      Authenticator.authenticate_test_environment
      expect(Authenticator.account_sid).not_to be_nil
      expect(Authenticator.auth_token).not_to be_nil
    end
  end
end