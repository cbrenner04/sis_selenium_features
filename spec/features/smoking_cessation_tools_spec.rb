# filename: smoking_cessation_tools_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'pages/smoking_cessation_tool'
require 'pages/session'
require 'pages/session_one'
require 'pages/settings_page'
require 'pages/cessation'
require 'pages/quit_reason'
require 'pages/risky'
require 'pages/modal'
require 'pages/risky_times_strategies'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def smoking_cessation_tool
  @smoking_cessation_tool ||= SmokingCessationTool.new
end

def cessation_date
  @cessation_date ||= Cessation.new
end

feature 'Participant navigates to Smoking Cessation tools' do
  background do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
    smoking_cessation_tool.open
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  scenario 'and resets quit date' do
    smoking_cessation_tool.open_tool('SCHEDULE YOUR QUIT DAY')

    expect(settings_page).to have_cessation_date_selector_present

    cessation_date.pick_date
    cessation_date.click_set

    expect(page).to have_content '4 day until quit day!'
  end

  scenario 'and cancels reset quit date' do
    smoking_cessation_tool.open_tool('SCHEDULE YOUR QUIT DAY')

    expect(settings_page).to have_cessation_date_selector_present

    cessation_date.pick_date
    cessation_date.click_cancel

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'completes Reasons for Quitting tool' do
    smoking_cessation_tool.open_tool('YOUR REASONS FOR QUITTING')
    enter_quit_reason

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'deletes an entry in Reasons for Quitting tool' do
    smoking_cessation_tool.open_tool('YOUR REASONS FOR QUITTING')
    remove_quit_reason

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'completes Manging Challenging Times tool' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    enter_risky_times
    settings_page.assert_on_page

    expect(settings_page).to have_save_present

    smoking_cessation_tool.click_done
  end

  scenario 'sees content specific instructions in Challenging Times modal' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    risky_times_strategies.open
    risky_times_strategies.open_negative_emotions_strategy

    expect(risky_times_strategies).to have_negative_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_positive_emotions_strategy

    expect(risky_times_strategies).to have_positive_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_social_situations_strategy

    expect(risky_times_strategies).to have_social_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_drinking_alcohol_strategy

    expect(risky_times_strategies).to have_alcohol_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_habitual_smoking_strategy

    expect(risky_times_strategies).to have_habitual_smoking_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_hands_strategy

    expect(risky_times_strategies).to have_hands_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.exit
  end

  scenario 'adds a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    risky_times.create

    expect(risky_times).to have_two_risky_times_present

    smoking_cessation_tool.click_done
  end

  scenario 'removes a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')

    expect(risky_times).to have_risky_time_present('Test Risky Time')

    risky_times.remove

    expect(risky_times).to_not have_risky_time_present('Test Risky Time')

    smoking_cessation_tool.click_done
  end

  scenario 'edits a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')

    expect(risky_times).to_not have_risky_time_present('do something kind')

    risky_times.open_edit_time
    risky_times.set_new_strategy
    risky_times.save_edited_time

    expect(risky_times).to have_risky_time_present('do something kind')

    smoking_cessation_tool.click_done
  end

  scenario 'completes Enlisting Your Social Supports tool' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')
    enter_social_supports
    settings_page.assert_on_page

    expect(settings_page).to_not have_save_present

    smoking_cessation_tool.click_done
  end

  scenario 'adds a social support' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')
    social_supports.create
    settings_page.save_modal

    expect(social_supports).to have_two_supports_present

    smoking_cessation_tool.click_done
  end

  scenario 'removes a social support' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')

    expect(social_supports).to have_test_social_support_present

    social_supports.remove

    expect(social_supports).to_not have_test_social_support_present

    smoking_cessation_tool.click_done
  end

  scenario 'completes Benefits of Quitting tool' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')

    complete_with_response_2

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'completes Scheduling Your Quit Day tool' do
    smoking_cessation_tool.open_tool('SCHEDULING YOUR QUIT DAY')

    complete_with_response_3

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'completes Concerns About Quitting' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')

    complete_with_response_4

    expect(page).to have_content '4 days until quit day!'
  end
end

def complete_with_response_1
  session_one.assert_on_session1_1
  answer_question_with(1)
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session.finish
end

def complete_with_response_2
  session_one.assert_on_session1_1
  answer_question_with(2)
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session.finish
end

def complete_with_response_3
  session_one.assert_on_session1_1
  answer_question_with(3)
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session.finish
end

def complete_with_response_4
  session_one.assert_on_session1_1
  answer_question_with(4)
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session_one.assert_on_session1_2
  session.move_to_next_slide
  session.finish
end
