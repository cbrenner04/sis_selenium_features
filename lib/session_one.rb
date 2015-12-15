# page object for the first page of Session 1
class SessionOne
  include Capybara::DSL

  def start
    assert_app_configured
    start_button.click
  end

  def finish
    home_button.click
  end

  def completed?
    within('.row', text: 'session 1') do
      find('.label-success')
      find('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  def set_notes
    find('#notes').set('bad reason')
  end

  def assert_on_session1_1
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
  end

  def assert_on_session1_reasons
    find('h3', text: 'Your Reasons for Quitting Smoking')
  end

  def assert_on_session1_3
    find('h4', text: 'You have installed this app, because you are intereste' \
                     'd in quitting smoking.')
  end

  def assert_on_session1_4
    find('h3', text: 'Congratulations!')
  end

  def assert_on_session1_benefits
    find('h3', text: 'Benefits of Quitting Smoking')
  end

  def assert_on_session1_benefits1
    find('h3', text: 'Healthy Changes Over Time')
  end

  def assert_on_session1_5
    find('h3', text: 'Ready to Quit?')
  end

  def assert_on_session1_7
    find('h4', text: 'You are not ready to quit at this time.')
  end

  def assert_on_session1_8
    find('h4', text: 'Great, you are ready to prepare for your quit day!')
  end

  def assert_on_session1_8b
    find('.well', text: 'You have already quit smoking')
  end

  def assert_on_session1_9
    find('h3', text: 'Preparing for Your Quit Day')
  end

  def assert_on_session1_10
    find('h3', text: 'Concerns about Quitting')
  end

  def assert_on_session1_11
    find('h4',
         text: 'You\'re concerned that you\'ll feel tired without a cigarette.')
  end

  def assert_on_session1_19
    find('h4', text: 'Now that we have gone over some general concerns')
  end

  def assert_on_session1_19c
    find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
  end

  def assert_on_session1_notready
    find('h4', text: 'You\'ve decided that now is not the right time for you' \
              ' to schedule and prepare for your quit day.')
  end

  def assert_on_session1_20
    find('h3', text: 'Challenging Times During Your Quit Attempt')
  end

  def assert_on_session1_21
    find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
  end

  def assert_on_session1_28
    find('h3', text: 'Additional Strategies')
  end

  def assert_on_social_support1
    find('h3', text: 'Identify your Social Support')
  end

  def assert_on_session1_social6
    find('h3', text: 'Excellent!')
  end

  def assert_on_session1_social7
    find('.well', text: 'You can\'t think of anyone in your life who would s' \
                        'upport you in your quit attempt.')
  end

  def assert_on_session1_social8
    find('.well', text: 'You feel that there is nobody in your life who woul' \
                        'd support your upcoming quit attempt.')
  end

  def assert_on_session1_social9
    find('h4', text: 'You\'ve decided to do this quit attempt without any he' \
                     'lp from other people.')
  end

  def assert_on_session1_social9b
    find('h4', text: 'You have decided to try out the quitline and/or the on' \
                     'line forum')
  end

  def assert_on_session1_social10a
    find('.well', text: 'Enlisting Your Social Support')
  end

  def assert_on_session1_schedule
    find('h3', text: 'Schedule Your Quit Day')
  end

  def assert_on_quitday_scheduled
    find('h3', text: 'CONGRATULATIONS!')
  end

  def assert_on_quitday_scheduled2
    find('h4', text: 'It\'s a big step')
  end

  def assert_on_difficult2
    find('h3', text: 'Receiving Reminders To Stay on Track')
  end

  def assert_on_ending
    find('h3',
         text: 'Congrats again: You are now all set for your quit day!')
  end

  def assert_on_ending2
    find('h3', text: 'Excellent!')
  end

  private

  def start_button
    find('.btn.btn-primary', text: 'START NOW')
  end

  def assert_app_configured
    find('p', text: 'Ready to begin?')
  end

  def home_button
    find('.btn.btn-primary', text: 'GO HOME')
  end
end
