# page object for session two
class SessionTwo
  include Capybara::DSL

  def available_soon?
    within('.row', text: 'session 2') do
      find('.label-warning')
    end
  end

  def available?
    within('.row', text: 'session 2') do
      find('.label-success')
    end
  end

  def completed?
    within('.row', text: 'session 2') do
      find('.label-success')
      find('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  def open
    find('.btn.btn-default', text: 'SMOKING CESSATION SESSIONS').click
  end

  def assert_on_session2_smokingstatus
    find('h3', text: 'Today is your Quit Day!')
  end

  def assert_on_session2_1
    find('h3', text: 'That\'s great!')
  end

  def assert_on_session2_reschedulingday
    find('h4',
         text: 'Today didn\'t work out, but you are ready to try again...')
  end

  def assert_on_not_quit
    find('h4', text: 'What do you want to do now?')
  end

  def assert_on_session2_notready
    find('h4',
         text: 'You\'ve decided that you are no longer ready to quit smoking.')
  end

  def assert_on_session2_notready2
    find('h4', text: 'What do you want to do now?')
  end

  def assert_on_retry_later
    find('h3', text: 'Glad to hear it!')
  end

  def assert_on_retry_later2
    find('h3', text: 'Excellent')
  end

  def assert_on_got_time
    find('h4', text: 'Got a few minutes?')
  end

  def assert_on_session2_overview
    find('h3', text: 'Splendid!')
  end

  def assert_on_session2_strategies2
    find('h3', text: 'Review Your Strategies')
  end

  def assert_on_session2_stratok
    find('h3', text: 'Glad to hear it!')
  end

  def assert_on_session2_social_support_1
    find('h3', text: 'Checking in About Your Social Support')
  end

  def assert_on_session2_social3a
    find('h3', text: 'That\'s great!')
  end

  def assert_on_session2_think1
    find('h3', text: 'Sabotaging Thoughts')
  end

  def assert_on_session2_traps
    find('h3', text: 'Combating Your Sabotaging Thoughts')
  end

  def assert_on_session2_traps1a
    find('h4', text: 'What\'s an alternative to the thought:')
  end

  def assert_on_session2_traps1b
    find('h3', text: 'Great!')
  end

  def assert_on_session2_checkingin4
    find('h3', text: 'Alright, that concludes your check-in!')
  end

  def assert_on_session2_checkingin4a
    find('h3', text: 'That\'s fantastic!')
  end

  def assert_on_session2_end
    find('h4', text: 'What do you want to do now?')
  end
end
