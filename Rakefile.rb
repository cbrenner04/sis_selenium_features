# frozen_string_literal: true
# filename: Rakefile.rb

require './spec/env'

# load development version of app and dashboard locally

desc 'Set up and start SiS app for testing locally'

task :load_app_local do
  Dir.chdir("#{ENV['Path']}/sis_app/") do
    system('npm run browser:add_platform')
    system('npm run browser:simulator')
  end
end

desc 'Set up and start SiS dashboard for testing locally'

task :load_app_dash_local do
  Dir.chdir("#{ENV['Path']}/sis_dashboard/") do
    system('rake db:drop db:create db:migrate')
    system('rails s')
  end
end
