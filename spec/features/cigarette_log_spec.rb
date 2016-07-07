# frozen_string_literal: true
# filename: cigarette_log_spec.rb

# require page objects
require 'pages/cigarette_log'

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
end
