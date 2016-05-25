# filename: home_page_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'pages/session_one'
require 'pages/session_two'
require 'pages/session_three'
require 'pages/happiness_exercise'
require 'pages/modal'
require 'pages/update_smoking_status'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def update_smoking_status
  @update_smoking_status ||= UpdateSmokingStatus.new
end

describe 'Participant opens app', type: :feature do
  def load(exercise)
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      execute_script('window.location.reload()')
      break if has_css?('.wide.btn.btn-default', text: exercise)
      execute_script('localStorage.clear()')
    end
  end

  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'shows cessation date in the future' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(page).to have_content '4 days until quit day'
  end

  it 'shows cessation date is today' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(page).to have_content "It's Your Quit day"
  end

  it 'shows cessation date is in the past' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(page).to have_content '7 days since you quit'
  end

  it 'shows only first session is available' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(session_one).to be_completed

    expect(session_two).to be_available_soon

    expect(session_three).to be_unavailable
  end

  it 'shows second session is available but 7 days from third' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(session_two).to be_available

    expect(session_three).to be_available_in_7_days
  end

  it 'one day from third session' do
    insert_all(CessationDate::DATE_4, Sessions::SESSION_2)
    page.evaluate_script('window.location.reload()')

    expect(session_three).to be_available_in_1_day
  end

  it 'shows third session is available' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')

    expect(session_three).to be_available
  end

  it 'shows available good things exercises' do
    load('THREE GOOD THINGS')
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

  it 'shows one complete, two available good things exercises' do
    load('THREE GOOD THINGS')
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

  it 'shows two complete, one available good things exercises' do
    load('THREE GOOD THINGS')
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

  it 'shows complete available good things exercises' do
    load('THREE GOOD THINGS')
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

  it 'shows available experiencing kindness exercises' do
    load('EXPERIENCING KINDNESS')

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  it 'shows one complete, one available experiencing kindness exercises' do
    load('EXPERIENCING KINDNESS')
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

  it 'shows complete experiencing kindness exercises' do
    load('EXPERIENCING KINDNESS')
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

  it 'shows available savoring exercises' do
    load('SAVORING')
    page.evaluate_script('window.location.reload()')

    within happiness_exercises.row(1) do
      expect(happiness_exercises).to be_pending
    end

    within happiness_exercises.row(2) do
      expect(happiness_exercises).to be_pending
    end
  end

  it 'shows one available, one complete savoring exercises' do
    load('SAVORING')
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

  it 'shows complete savoring exercises' do
    load('SAVORING')
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

  it 'updates smoking status' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
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
