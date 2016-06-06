# frozen_string_literal: true
# page object for session three
class SessionThree
  include Capybara::DSL

  def unavailable?
    session3_row.has_css?('.label-info')
  end

  def available_in_7_days?
    session3_row.has_css?('.label-info', text: '7 days')
  end

  def available_in_1_day?
    session3_row.has_css?('.label-warning', text: '1 day')
  end

  def available?
    session3_row.has_css?('.label-success')
  end

  def completed?
    session3_row.has_css?('.label-success') &&
      session3_row.has_css?('.glyphicon-check')
  end

  def assert_on_session3_smokingstatus
    find('h3', text: 'Welcome to your third smoking cessation session!')
  end

  def assert_on_session3_1
    find('h3', text: 'Congratulations on being quit for one week!')
  end

  def assert_on_session3_1a
    find('h3', text: 'Congratulations on being quit for one week!')
  end

  def assert_on_session3_reschedulingday
    find('h4', text: 'You indicated you want to schedule another quit day.')
  end

  def assert_on_session3_notinterested
    find('h4', text: 'You\'ve decided that now is not the right time')
  end

  def assert_on_session3_notquitcontinue
    find('.well', text: 'Even though you\'re not ready to quit smoking yet')
  end

  def assert_on_session3_gottime
    find('h4', text: 'Got a few minutes for this session?')
  end

  def assert_on_session3_benefits
    find('h4',
         text: 'What things have you noticed are different from last week')
  end

  def assert_on_session3_notready
    find('h4', text: 'You\'ve decided that now is not the right time')
  end

  def assert_on_session3_strategies2
    find('.well', text: 'Here\'s a list of your strategies that you came up ' \
                        'with last week')
  end

  def assert_on_session3_strategiesupdate
    find('h4', text: 'Do you already know the strategies you\'d like to add')
  end

  def assert_on_session3_strategiesupdate2
    find('h3', text: 'That\'s great!')
  end

  def assert_on_session3_strategies2a
    find('h3', text: 'Challenging Times During Your Quit Attempt')
  end

  def assert_on_session3_strategies2aoth
    find('h4',
         text: 'What other challenging times/situations might trigger you?')
  end

  def assert_on_session3_strategies2b
    find('h3', text: 'Dealing with Negative Emotions without Smoking')
  end

  def assert_on_session3_3h
    find('h3', text: 'Additional Strategies')
  end

  def assert_on_session3_social_support1
    find('.well',
         text: 'Research has shown that one of the most important things')
  end

  def assert_on_session3_social3
    find('h3', text: 'Social Support Check In')
  end

  def assert_on_session3_social3a
    find('h3', text: 'That\'s great!')
  end

  def assert_on_session3_thinking
    find('h4', text: 'Last week...')
  end

  def assert_on_session3_thinkingtraps
    find('.well', text: 'Choose a few thoughts')
  end

  def assert_on_session3_think1a
    find('h4', text: 'What\'s an alternative to thinking')
  end

  def assert_on_session3_think1b
    find('h3', text: 'Nicely done!')
  end

  def assert_on_session3_checkingin4
    find('h4', text: 'How are things going today overall')
  end

  def assert_on_session3_checkingin4a
    find('h3', text: 'That\'s terrific!')
  end

  def assert_on_session3_schedule
    find('h3', text: 'Re-scheduling Your Quit Day')
  end

  def assert_on_session3_quitday_ready
    find('h3', text: 'Splendid!')
  end

  def assert_on_session3_quitday_scheduled
    find('h3', text: 'CONGRATULATIONS!')
  end

  def assert_on_session3_quitday_not_ready
    find('h4', text: 'That\'s ok!')
  end

  def assert_on_session3_ending
    find('h3', text: 'Congrats again: You are one week')
  end

  private

  def session3_row
    find('.row', text: 'session 3')
  end
end
