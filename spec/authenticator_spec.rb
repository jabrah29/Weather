require_relative '../app/api/authenticator'

describe Authenticator do

  describe ".authenticate_test_environment" do
    it "correctly sets token and auth password" do
      Authenticator.authenticate_test_environment('KEY','PASSWORD')
      expect(Authenticator.account_sid).to eql('KEY')
      expect(Authenticator.auth_token).to eql('PASSWORD')
    end
  end
end