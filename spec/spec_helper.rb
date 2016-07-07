# frozen_string_literal: true
# filename: spec_helper.rb

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'json'

# set driver browser
def browser
  if ENV['safari']
    :safari
  elsif ENV['firefox']
    :firefox
  else
    :chrome
  end
end

# RSpec configuration options
RSpec.configure do |config|
  config.full_backtrace = false
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.run_all_when_everything_filtered = true
  config.profile_examples = 10
end

# Capybara configuration options
Capybara.configure do |config|
  config.default_max_wait_time = 2
  config.default_driver = :selenium
  config.register_driver :selenium do |app|
    Selenium::WebDriver::Firefox::Binary.path = ENV['Firefox_Path']
    Capybara::Selenium::Driver.new(app, browser: browser)
  end
  config.page.driver.browser.manage.window.resize_to(360, 591)
  config
    .save_path = "#{ENV['Path']}/sis_selenium_features/spec/screenshots/"
end

# capybara-screenshot configuration options
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  example.description.tr(' ', '-').gsub(%r{/^.*\/spec\//}, '')
end
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
