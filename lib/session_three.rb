# page object for session three
class SessionThree
  include Capybara::DSL

  def unavailable?
    within('.row', text: 'session 3') do
      find('.label-info')
    end
  end

  def available_in_7_days?
    within('.row', text: 'session 3') do
      find('.label.label-lg.label-info', text: '7 days')
    end
  end

  def available_in_1_day?
    within('.row', text: 'session 3') do
      find('.label.label-lg.label-warning', text: '1 day')
    end
  end

  def available_soon?
    within('.row', text: 'session 2') do
      find('.label-warning')
    end
  end

  def available?
    within('.row', text: 'session 3') do
      find('.label-success')
    end
  end

  def completed?
    within('.row', text: 'session 3') do
      find('.label-success')
      find('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  def assert_on_session3_smokingstatus
    find('h3', text: 'Welcome to your third smoking cessation session!')
  end

  def assert_on_session3_1
    find('h3', text: 'Congratulations on being quit for one week!')
  end

  def assert_on_session3_gottime
    find('h4', text: 'Got a few minutes for this session?')
  end

  def assert_on_session3_benefits
    find('h4',
         text: 'What things have you noticed are different from last week')
  end

  def assert_on_session3_strategies2
    find('.question.well',
         text: 'Here\'s a list of your strategies that you came up with last' \
               ' week')
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
    find('.question.well',
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
    find('.question.well', text: 'Choose a few thoughts')
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
end
