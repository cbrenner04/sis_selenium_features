# frozen_string_literal: true
# filename: cigarette_log_spec.rb

# require page objects
require 'pages/cigarette_log'
require 'local_storage/local_session'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def cigarette_log
  @cigarette_log ||= CigaretteLog.new
end

feature 'Participant opens app' do
  background do
    visit ENV['Base_URL']
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload
  end

  after { navigation.clear_data }

  scenario 'navigates to Cigarette Log for 1 cigarette' do
    cigarette_log.open
    cigarette_log.click_1_cig

    expect(page).to have_content 'Why did you smoke?'

    expect(page).to_not have_content 'How many cigarettes ' \
                                     'have you smoked since your last log?'

    expect(continue).to_not be_visible
  end

  scenario 'completes Cigarette Log for 1 cigarette' do
    cigarette_log.open
    cigarette_log.click_1_cig

    expect(continue).to_not be_visible

    cigarette_log.set_reason
    continue.select_continue

    expect(continue).to_not be_visible

    cigarette_log.set_rating

    expect(page).to have_content '6'

    continue.select_continue

    expect(page).to have_content 'MOOD: Please tell us how you felt'
  end

  scenario 'and cannot complete ema after registering 1 cigarette' do
    insert(LocalSession::KEY, LocalSession::CIG_1)
    cigarette_log.open
    cigarette_log.click_1_cig
    cigarette_log.set_reason
    continue.select_continue
    cigarette_log.set_rating
    continue.select_continue

    expect(page).to have_content 'MOOD: Please tell us how you felt'

    visit ENV['Base_URL']
    cigarette_log.open
    cigarette_log.click_1_cig
    cigarette_log.set_reason
    continue.select_continue
    cigarette_log.set_rating
    continue.select_continue

    expect(page).to have_content 'Thank you!'
  end

  # The following test has a 1 in 1000000 chance of failing, assuming there
  # are no errors in the test. Run test again.
  scenario 'and cannot complete ema after registering 1 million cigarette' do
    insert(LocalSession::KEY, LocalSession::CIG_MIL)
    cigarette_log.open
    cigarette_log.click_1_cig
    cigarette_log.set_reason
    continue.select_continue
    cigarette_log.set_rating
    continue.select_continue

    expect(page).to have_content 'Thank you!'
  end

  scenario 'navigates to Cigarette Log for 2+ cigarettes' do
    cigarette_log.open
    cigarette_log.click_2_cig

    expect(page).to have_content 'Why did you smoke?'

    expect(page).to have_content 'How many cigarettes ' \
                                 'have you smoked since your last log?'

    expect(continue).to_not be_visible
  end

  scenario 'completes Cigarette Log for 2+ cigarettes' do
    cigarette_log.open
    cigarette_log.click_2_cig

    expect(continue).to_not be_visible

    cigarette_log.set_num_cigs
    cigarette_log.set_reason
    continue.select_continue

    expect(continue).to_not be_visible

    cigarette_log.set_rating

    expect(page).to have_content '6'

    continue.select_continue

    expect(page).to have_content 'MOOD: Please tell us how you felt'
  end

  scenario 'view cigarette log graph' do
    cigarette_log.open
    cigarette_log.open_view_graph

    expect(page).to have_content 'Your Reported Cigarettes per Day'
  end
end
