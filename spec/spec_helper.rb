# filename: spec_helper.rb

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'

# require local_storage files
require_relative './support/local_storage/authentication_token.rb'
require_relative './support/local_storage/cessation_date.rb'
require_relative './support/local_storage/cessation_reasons.rb'
require_relative './support/local_storage/exercises.rb'
require_relative './support/local_storage/participant_exercise_question_answers.rb'
require_relative './support/local_storage/risky_times.rb'
require_relative './support/local_storage/sessions.rb'
require_relative './support/local_storage/social_supports.rb'

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
  config.profile_examples = 10
end

# Capybara configuration options
Capybara.configure do |config|
  config.default_wait_time = 2
  config.default_driver = :selenium
  config.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: browser)
  end
  config.page.driver.browser.manage.window.resize_to(360, 591)
  config.save_and_open_page_path = 'screenshots/'
end

# capybara-screenshot configuration options
Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  "#{example.description.tr(' ', '-').gsub(/^.*\/spec\//, '')}"
end
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
