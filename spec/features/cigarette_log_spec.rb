# filename: cigarette_log_spec.rb

# require page objects
require 'cigarette_log'
require 'continue'

def cigarette_log
  CigaretteLog.new
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

    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')

    cigarette_log.set_reason
    continue.select_continue

    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')

    cigarette_log.set_rating
    continue.select_continue
    cigarette_log.save

    expect(page).to have_content '4 days until quit day'
  end

  it "chooses a various reasons under 'I forgot to enter a cigarette'" do
    cigarette_log.open
    cigarette_log.choose_forgot_to_enter

    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')

    cigarette_log.set_reason
    continue.select_continue

    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')

    cigarette_log.set_rating
    continue.select_continue
    cigarette_log.save

    expect(page).to have_content '4 days until quit day'
  end
end
