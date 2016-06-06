# frozen_string_literal: true
# filename: home_page_spec.rb

# require page objects
require 'pages/update_smoking_status'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def update_smoking_status
  @update_smoking_status ||= UpdateSmokingStatus.new
end

feature 'Participant opens app' do
  background { visit ENV['Base_URL'] }

  after { navigation.clear_data }

  scenario 'shows cessation date in the future' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload

    expect(page).to have_content '4 days until quit day'
  end

  scenario 'shows cessation date is today' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    navigation.reload

    expect(page).to have_content "It's Your Quit day"
  end

  scenario 'shows cessation date is in the past' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    navigation.reload

    expect(page).to have_content '7 days since you quit'
  end

  scenario 'shows only first session is available' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload

    expect(session_one).to be_completed
    expect(session_two).to be_available_soon
    expect(session_three).to be_unavailable
  end

  scenario 'shows second session is available but 7 days from third' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    navigation.reload

    expect(session_two).to be_available
    expect(session_three).to be_available_in_7_days
  end

  scenario 'one day from third session' do
    insert_all(CessationDate::DATE_4, Sessions::SESSION_2)
    navigation.reload

    expect(session_three).to be_available_in_1_day
  end

  scenario 'shows third session is available' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    navigation.reload

    expect(session_three).to be_available
  end

  scenario 'shows available good things exercises' do
    happiness_exercises.load('Three Good Things')
    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(3) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows one complete, two available good things exercises' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.answer_question_with(1, 'First good thing')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(3) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows two complete, one available good things exercises' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.answer_question_with(1, 'First good thing')
    happiness_exercises.answer_question_with(2, 'Second good thing')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(3) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows complete available good things exercises' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.answer_question_with(1, 'First good thing')
    happiness_exercises.answer_question_with(2, 'Second good thing')
    happiness_exercises.answer_question_with(3, 'Third good thing')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(3) do
      expect(happiness_exercises).to be_completed
    end
  end

  scenario 'shows available experiencing kindness exercises' do
    happiness_exercises.load('Experiencing Kindness')

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows one complete, one available kindness exercises' do
    happiness_exercises.load('Experiencing Kindness')
    happiness_exercises.open('Experiencing Kindness')
    happiness_exercises.open('EXPERIENCING KINDNESS')
    happiness_exercises.answer_question_with(1, 'First kindness experience')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows complete experiencing kindness exercises' do
    happiness_exercises.load('Experiencing Kindness')
    happiness_exercises.open('Experiencing Kindness')
    happiness_exercises.open('EXPERIENCING KINDNESS')
    happiness_exercises.answer_question_with(1, 'First kindness experience')
    happiness_exercises.answer_question_with(2, 'Second kindness experience')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_completed
    end
  end

  scenario 'shows available savoring exercises' do
    happiness_exercises.load('Savoring')
    navigation.reload

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows one available, one complete savoring exercises' do
    happiness_exercises.load('Savoring')
    happiness_exercises.open('Savoring')
    happiness_exercises.open('SAVORING')
    happiness_exercises.answer_question_with(1, 'First savoring')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  scenario 'shows complete savoring exercises' do
    happiness_exercises.load('Savoring')
    happiness_exercises.open('Savoring')
    happiness_exercises.open('SAVORING')
    happiness_exercises.answer_question_with(1, 'First savoring')
    happiness_exercises.answer_question_with(2, 'Second savoring')
    modal.save

    expect(modal).to have_success_alert_present

    modal.exit

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_completed
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_completed
    end
  end

  scenario 'updates smoking status' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload
    update_smoking_status.open
    update_smoking_status.select_preparing_for_quit

    expect(page).to have_content '4 days until quit day'

    update_smoking_status.open
    update_smoking_status.select_still_quit

    expect(page).to have_content '4 days until quit day'

    update_smoking_status.open
    update_smoking_status.select_slipped

    expect(page).to have_content '4 days until quit day'

    update_smoking_status.open
    update_smoking_status.select_not_quitting

    expect(page).to have_content '4 days until quit day'
  end
end
