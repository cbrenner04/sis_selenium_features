# filename: cigarette_log_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'page_objects/cigarette_log'
require 'page_objects/continue'

def cigarette_log
  @cigarette_log ||= CigaretteLog.new
end

describe 'Participant opens app', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'navigates to Cigarette Log' do
    cigarette_log.open
    expect(page).to have_content 'Cigarette Log'
    expect(page).to have_content "I'M SMOKING NOW..."
    expect(page).to have_content 'I FORGOT TO ENTER A CIGARETTE'
  end

  it "chooses a various reasons under 'I'm smoking now...'" do
    cigarette_log.open
    cigarette_log.choose_smoking_now

    expect(continue).to_not be_present

    cigarette_log.set_reason
    continue.select_continue

    expect(continue).to_not be_present

    cigarette_log.set_rating
    continue.select_continue
    cigarette_log.save

    expect(page).to have_content '4 days until quit day'
  end

  it "chooses a various reasons under 'I forgot to enter a cigarette'" do
    cigarette_log.open
    cigarette_log.choose_forgot_to_enter

    expect(continue).to_not be_present

    cigarette_log.set_reason
    continue.select_continue

    expect(continue).to_not be_present

    cigarette_log.set_rating
    continue.select_continue
    cigarette_log.save

    expect(page).to have_content '4 days until quit day'
  end
end
