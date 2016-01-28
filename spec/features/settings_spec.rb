# filename: settings_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'pages/settings_page'
require 'pages/cessation'
require 'pages/social'
require 'pages/quit_reason'
require 'pages/risky'
require 'pages/modal'
require 'pages/risky_times_strategies'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def risky_times_strategies
  @risky_times_strategies ||= RiskyTimesStrategy.new
end

describe 'Participant opens app', type: :feature do
  context 'due to incomplete configuration' do
    before do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      page.execute_script("localStorage.removeItem('riskyTimes')")
      page.execute_script('window.location.reload()')
    end

    after do
      page.execute_script('localStorage.clear()')
    end

    it 'redirects to settings menu' do
      settings_page.assert_on_page

      expect(settings_page).to_not have_save_present
    end

    it 'redirects to settings menu, updates cessation date' do
      enter_cessation_date

      expect(settings_page).to have_cessation_date_selector_present

      expect(settings_page).to_not have_save_present
    end

    it 'redirects to settings menu, adds reasons for stopping smoking' do
      quit_reason.open
      enter_quit_reason
      settings_page.assert_on_page

      expect(settings_page).to_not have_save_present
    end

    it 'redirects to settings menu, adds risky times' do
      settings_page.open_risky_times
      enter_risky_times
      settings_page.assert_on_page

      expect(settings_page).to have_save_present
    end

    it 'redirects to settings menu, adds social supports' do
      social_supports.open
      enter_social_supports
      settings_page.assert_on_page

      expect(settings_page).to_not have_save_present
    end

    it 'redirects to settings menu, completes configuration' do
      expect(settings_page).to_not have_save_present

      enter_cessation_date

      quit_reason.open
      enter_quit_reason

      settings_page.open_risky_times
      enter_risky_times

      social_supports.open
      social_supports.create
      settings_page.save_modal
      modal.exit

      settings_page.assert_on_page
      settings_page.save

      expect(page).to have_content 'It\'s Your Quit day!'
    end
  end

  context 'after configuration is complete, visits configuration page' do
    before do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      settings_page.open
    end

    after do
      page.execute_script('localStorage.clear()')
    end

    it 'returns home' do
      settings_page.assert_on_page
      settings_page.save

      expect(page).to have_content '4 days until quit day'
    end

    it 'updates cessation date' do
      enter_cessation_date

      expect(settings_page).to have_cessation_date_selector_present
    end

    it 'adds a reason for stopping smoking' do
      quit_reason.open
      quit_reason.create
      settings_page.save_modal

      expect(quit_reason).to have_two_quit_reasons_present
    end

    it 'removes a reason for stopping smoking' do
      quit_reason.open

      expect(quit_reason).to have_test_reason_present

      quit_reason.remove

      expect(quit_reason).to_not have_test_reason_present
    end

    it 'sees content specific instructions in risky times modal' do
      settings_page.open_risky_times
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

    it 'adds a risky time' do
      settings_page.open_risky_times
      risky_times.create

      expect(risky_times).to have_two_risky_times_present
    end

    it 'removes a risky time' do
      settings_page.open_risky_times

      expect(risky_times).to have_risky_time_present('Test Risky Time')

      risky_times.remove

      expect(risky_times).to_not have_risky_time_present('Test Risky Time')
    end

    it 'edits a risky time' do
      settings_page.open_risky_times

      expect(risky_times).to_not have_risky_time_present('do something kind')

      risky_times.open_edit_time
      risky_times.set_new_strategy
      risky_times.save_edited_time

      expect(risky_times).to have_risky_time_present('do something kind')
    end

    it 'adds a social support' do
      social_supports.open
      social_supports.create
      settings_page.save_modal

      expect(social_supports).to have_two_supports_present
    end

    it 'removes a social support' do
      social_supports.open

      expect(social_supports).to have_test_social_support_present

      social_supports.remove

      expect(social_supports).to_not have_test_social_support_present
    end
  end
end
