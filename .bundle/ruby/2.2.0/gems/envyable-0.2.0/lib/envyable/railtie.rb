module Envyable
  class Railtie < Rails::Railtie
    initializer "envyable.load", :before => :load_environment_config do
      Envyable.load Rails.root.join('config', 'env.yml'), Rails.env
    end
  end
end
