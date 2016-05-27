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

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def smoking_cessation_tool
  @smoking_cessation_tool ||= SmokingCessationTool.new
end

def cessation_date
  @cessation_date ||= Cessation.new
end

feature 'Participant navigates to Smoking Cessation tools', do
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

  def method_name
    
  end

  scenario 'completes Reasons for Quitting tool' do
    smoking_cessation_tool.open_tool('YOUR REASONS FOR QUITTING')

    complete_with_response_1

    expect(page).to have_content '4 days until quit day!'
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

  scenario 'completes Manging Challenging Times tool' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')

    complete_with_response_1

    expect(page).to have_content '4 days until quit day!'
  end

  scenario 'completes Enlisting Your Social Supports tool' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')

    complete_with_response_2

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
