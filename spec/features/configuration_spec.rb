require_relative '../support/local_storage/authentication_token.rb'
require_relative '../support/local_storage/cessation_date.rb'
require_relative '../support/local_storage/cessation_reasons.rb'
require_relative '../support/local_storage/risky_times.rb'
require_relative '../support/local_storage/sessions.rb'
require_relative '../support/local_storage/social_supports.rb'

describe 'On initial app load', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees configuration token form' do
    expect(page).to have_content 'Please enter the configuration code'
  end

  it 'configures phone for offline use' do
    find('input[type = text]').set('offline')
    expect(page).to have_content 'START NOW'
  end
end
