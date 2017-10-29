require 'envyable'

module Authenticator

  @account_sid = ''
  @auth_token = ''
  def self.load_test_environment
    Envyable.load('./config/env.yml', 'test')
  end

  def self.load_dev_environment
    Envyable.load('./config/env.yml', 'development')
  end

  def self.authenticate_test_environment(key,auth_token)
    load_test_environment
    @account_sid = key
    @auth_token = auth_token
  end

  def self.authenticate_dev_environment(key,auth_token)
    load_dev_environment
    @account_sid = key
    @auth_token = auth_token
  end

  def self.account_sid
    @account_sid
  end

  def self.auth_token
    @auth_token
  end


end