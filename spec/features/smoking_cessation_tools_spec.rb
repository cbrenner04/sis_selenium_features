# filename: smoking_cessation_tools_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'page_objects/smoking_cessation_tool'
require 'page_objects/session'
require 'page_objects/session_one'
require 'page_objects/settings_page'

def smoking_cessation_tool
  @smoking_cessation_tool ||= SmokingCessationTool.new
end

describe 'Participant navigates to Smoking Cessation tools', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
    smoking_cessation_tool.open
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'completes Reasons for Quitting tool' do
    smoking_cessation_tool.open_reasons_tool

    complete_with_response_1

    expect(page).to have_content '4 days until quit day!'
  end

  it 'completes Benefits of Quitting tool' do
    smoking_cessation_tool.open_benefits_tool

    complete_with_response_2

    expect(page).to have_content '4 days until quit day!'
  end

  it 'completes Scheduling Your Quit Day tool' do
    smoking_cessation_tool.open_scheduling_tool

    complete_with_response_3

    expect(page).to have_content '4 days until quit day!'
  end

  it 'completes Concerns About Quitting' do
    smoking_cessation_tool.open_concerns_tool

    complete_with_response_4

    expect(page).to have_content '4 days until quit day!'
  end

  it 'completes Manging Challenging Times tool' do
    smoking_cessation_tool.open_risky_times_tool

    complete_with_response_1

    expect(page).to have_content '4 days until quit day!'
  end

  it 'completes Enlisting Your Social Supports tool' do
    smoking_cessation_tool.open_social_support_tool

    complete_with_response_2

    expect(page).to have_content '4 days until quit day!'
  end
end

def complete_with_response_1
  session.start
  session_one.assert_on_session1_1
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session.finish
  settings_page.save
end

def complete_with_response_2
  session.start
  session_one.assert_on_session1_1
  answer_question_with(2)
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session.finish
  settings_page.save
end

def complete_with_response_3
  session.start
  session_one.assert_on_session1_1
  answer_question_with(3)
  session.move_to_next_slide
  session.finish
  settings_page.save
end

def complete_with_response_4
  session.start
  session_one.assert_on_session1_1
  answer_question_with(4)
  session.move_to_next_slide
  session_one.assert_on_session1_2
  session.move_to_next_slide
  session.finish
  settings_page.save
end
