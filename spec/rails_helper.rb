# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
require 'shoulda/matchers'
require 'devise'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium/webdriver'
Capybara.default_driver = :selenium

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.include Capybara::DSL
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  Capybara.default_driver = :selenium
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # 今回はRspecを使うのでこのように設定
    with.test_framework :rspec
    # shoulda-matchersを使いたいテストライブラリを指定
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end
