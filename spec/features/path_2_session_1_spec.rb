# filename: path_2_session_1_spec.rb

describe 'Participant loads app for the first time', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  describe 'responds question 1 with 3, responds to \'session1_5\' with 1' do
    it 'sees correct feedback' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      expect(page).to have_content 'You are not ready to quit at this time.'
    end

    it 'responds to \'session1_19b\' with 1' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      expect(page)
        .to have_content 'You\'ve decided to go ahead with a quit attempt'
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 1' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(1)
      expect(page).to have_content 'You\'ve decided that now is not the ri' \
                                   'ght time for you to schedule and prepa' \
                                   're for your quit day.'
      click_on 'Continue'
      find('h3', text: 'Difficult Times To Stay Smoke Free')
      find('.btn.btn-info',
           text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
      find('.btn-group.ng-scope', text: 'Tu').click
      find('#risky_time_time').click
      time = Time.now.strftime('%I:%M')
      if time.between?('10:58', '12:00') ||
         Time.now.strftime('%M') >= '58'
        find('.dwbw.dwb-s').click
        find('.well.modal-well', text: 'Add risky times below.')
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
      else
        risky_time = Time.now + (62 * 60)
        element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
        element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
        find('.dw-i', text: "#{risky_time.strftime('%p')}").click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
      end

      find('#exit_button').click
      find('h3', text: 'Difficult Times To Stay Smoke Free')
      click_on 'Continue'
      expect(page).to have_content 'Receiving Reminders To Stay on Track'
      # add path to home screen
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 2' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(1)
      expect(page).to have_content 'You\'ve decided that now is not the ri' \
                                   'ght time for you to schedule and prepa' \
                                   're for your quit day.'
      click_on 'Continue'
      find('h3', text: 'Difficult Times To Stay Smoke Free')
      answer_question(1)
      expect(page).to have_content 'You have chosen not to identify any time' \
                                   's you might have difficulty to remain sm' \
                                   'oke-free.'
      # add path to home screen
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 2' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Identify your Social Support')
      answer_question(1)
      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 3'do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Identify your Social Support')
      answer_question(2)
      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 4' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Identify your Social Support')
      answer_question(3)
      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 5' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Identify your Social Support')
      answer_question(4)
      expect(page).to have_content 'Excellent!'
    end

    it 'responds to \'session1_19b\' with 1, \'social_support\' with 6' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(0)
      find('h4', text: 'You are not ready to quit at this time.')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                       'a cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      answer_question(0)
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Identify your Social Support')
      answer_question(5)
      expect(page).to have_content 'You indicated "other"'
      find('#notes').set('bad reason')
      click_on 'Continue'
      expect(page).to have_content 'Excellent!'
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 1' do
      it 'responds to \'session1_social6\' with 2' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired withou' \
                         't a cigarette.')
        click_on 'Continue'
        find('h4', text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(1)
        expect(page).to have_content 'You\'ve decided to do this quit atte' \
                                     'mpt without any help'
        click_on 'Continue'
        expect(page).to have_content 'Schedule Your Quit Day'
      end

      it 'responds to \'session1_social6\' with 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3',
             text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired with' \
                         'out a cigarette.')
        click_on 'Continue'
        find('h4',
             text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(0)
        find('h3', text: 'Enlisting Your Social Support')
        expect(page).to have_content 'You have identified people who can hel' \
                                     'p you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 1, \'session1_schedule\' ' \
         'with 0' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3',
             text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired with' \
                         'out a cigarette.')
        click_on 'Continue'
        find('h4',
             text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(0)
        find('h3', text: 'Enlisting Your Social Support')
        find('.btn.btn-info').click
        fill_in 'name', with: 'Jane Doe'
        find('#reason').click
        find("option[value = 'He/she will offer encouragement along the way.'")
          .click
        find('#save_button').click
        find('#exit_button').click
        find('h3', text: 'Enlisting Your Social Support')
        click_on 'Continue'
        find('h3', text: 'Schedule Your Quit Day')
        answer_question(1)
        expect(page).to have_content 'That\'s ok'
      end

      describe 'responds to \'session1_social6\' with 1, ' \
               '\'session1_schedule\' with 1' do
        it 'sees correct feedback' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3',
               text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(2)
          find('h3', text: 'Congratulations!')
          click_on 'Continue'
          find('h3', text: 'Your Reasons for Quitting Smoking')
          find('.btn.btn-info').click
          fill_in 'reason', with: 'My reason'
          find('#save_button').click
          find('#exit_button').click
          click_on 'Continue'
          find('h3', text: 'Benefits of Quitting Smoking')
          answer_question(0)
          find('h3', text: 'Healthy Changes Over Time')
          click_on 'Continue'
          find('h3', text: 'Ready to Quit?')
          answer_question(0)
          find('h4', text: 'You are not ready to quit at this time.')
          click_on 'Continue'
          find('h3', text: 'Concerns about Quitting')
          answer_question(0)
          find('h4', text: 'You\'re concerned that you\'ll feel tired wi' \
                           'thout a cigarette.')
          click_on 'Continue'
          find('h4',
               text: 'Now that we have gone over some general concerns')
          answer_question(0)
          find('h4', text: 'You\'ve decided to go ahead with a quit atte' \
                           'mpt')
          click_on 'Continue'
          find('h3', text: 'Challenging Times During Your Quit Attempt')
          answer_question(0)
          find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
          click_on 'Continue'
          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          find('h3', text: 'Enlisting Your Social Support')
          find('.btn.btn-info').click
          expect(page).to have_css('#save_button[disabled = disabled]')
          fill_in 'name', with: 'Jane Doe'
          find('#reason').click
          find("option[value = 'He/she will offer encouragement along th" \
               "e way.'").click
          find('#save_button').click
          find('#exit_button').click
          find('h3', text: 'Enlisting Your Social Support')
          click_on 'Continue'
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          expect(page).to have_content 'Splendid!'
        end

        it 'responds to \'quitday_scheduled\' with 1' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3',
               text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(2)
          find('h3', text: 'Congratulations!')
          click_on 'Continue'
          find('h3', text: 'Your Reasons for Quitting Smoking')
          find('.btn.btn-info').click
          fill_in 'reason', with: 'My reason'
          find('#save_button').click
          find('#exit_button').click
          click_on 'Continue'
          find('h3', text: 'Benefits of Quitting Smoking')
          answer_question(0)
          find('h3', text: 'Healthy Changes Over Time')
          click_on 'Continue'
          find('h3', text: 'Ready to Quit?')
          answer_question(0)
          find('h4', text: 'You are not ready to quit at this time.')
          click_on 'Continue'
          find('h3', text: 'Concerns about Quitting')
          answer_question(0)
          find('h4', text: 'You\'re concerned that you\'ll feel tired ' \
                           'without a cigarette.')
          click_on 'Continue'
          find('h4',
               text: 'Now that we have gone over some general concerns')
          answer_question(0)
          find('h4', text: 'You\'ve decided to go ahead with a quit at' \
                           'tempt')
          click_on 'Continue'
          find('h3', text: 'Challenging Times During Your Quit Attempt')
          answer_question(0)
          find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
          click_on 'Continue'
          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          find('h3', text: 'Enlisting Your Social Support')
          find('.btn.btn-info').click
          expect(page).to have_css('#save_button[disabled = disabled]')
          fill_in 'name', with: 'Jane Doe'
          find('#reason').click
          find("option[value = 'He/she will offer encouragement along " \
               "the way.'").click
          find('#save_button').click
          find('#exit_button').click
          find('h3', text: 'Enlisting Your Social Support')
          click_on 'Continue'
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          find('h3', text: 'Splendid!')
          find('#cessation_date_selector').click
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%d') > '26'
            find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
          else
            cessation_date = Date.today + 32
            find('.dw-mon',
                 text: "#{cessation_date.strftime('%B')}").click
            element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
            find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
          end
          find('h3', text: 'Splendid!')
          click_on 'Continue'
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(0)
          expect(page).to have_content 'It should!'
        end

        it 'responds to \'quitday_scheduled\' with 0' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3',
               text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(2)
          find('h3', text: 'Congratulations!')
          click_on 'Continue'
          find('h3', text: 'Your Reasons for Quitting Smoking')
          find('.btn.btn-info').click
          fill_in 'reason', with: 'My reason'
          find('#save_button').click
          find('#exit_button').click
          click_on 'Continue'
          find('h3', text: 'Benefits of Quitting Smoking')
          answer_question(0)
          find('h3', text: 'Healthy Changes Over Time')
          click_on 'Continue'
          find('h3', text: 'Ready to Quit?')
          answer_question(0)
          find('h4', text: 'You are not ready to quit at this time.')
          click_on 'Continue'
          find('h3', text: 'Concerns about Quitting')
          answer_question(0)
          find('h4', text: 'You\'re concerned that you\'ll feel tired wi' \
                           'thout a cigarette.')
          click_on 'Continue'
          find('h4',
               text: 'Now that we have gone over some general concerns')
          answer_question(0)
          find('h4', text: 'You\'ve decided to go ahead with a quit atte' \
                           'mpt')
          click_on 'Continue'
          find('h3', text: 'Challenging Times During Your Quit Attempt')
          answer_question(0)
          find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
          click_on 'Continue'
          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          find('h3', text: 'Enlisting Your Social Support')
          find('.btn.btn-info').click
          expect(page).to have_css('#save_button[disabled = disabled]')
          fill_in 'name', with: 'Jane Doe'
          find('#reason').click
          find("option[value = 'He/she will offer encouragement along th" \
               "e way.'").click
          find('#save_button').click
          find('#exit_button').click
          find('h3', text: 'Enlisting Your Social Support')
          click_on 'Continue'
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          find('h3', text: 'Splendid!')
          find('#cessation_date_selector').click
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%d') > '26'
            find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
          else
            cessation_date = Date.today + 32
            find('.dw-mon', text: "#{cessation_date.strftime('%B')}").click
            element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
            find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
          end
          find('h3', text: 'Splendid!')
          click_on 'Continue'
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(1)
          expect(page).to have_content 'Good for you!'
        end

        it 'responds to \'difficult_1b\' with 1' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3',
               text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(2)
          find('h3', text: 'Congratulations!')
          click_on 'Continue'
          find('h3', text: 'Your Reasons for Quitting Smoking')
          find('.btn.btn-info').click
          fill_in 'reason', with: 'My reason'
          find('#save_button').click
          find('#exit_button').click
          click_on 'Continue'
          find('h3', text: 'Benefits of Quitting Smoking')
          answer_question(0)
          find('h3', text: 'Healthy Changes Over Time')
          click_on 'Continue'
          find('h3', text: 'Ready to Quit?')
          answer_question(0)
          find('h4', text: 'You are not ready to quit at this time.')
          click_on 'Continue'
          find('h3', text: 'Concerns about Quitting')
          answer_question(0)
          find('h4', text: 'You\'re concerned that you\'ll feel tired ' \
                           'without a cigarette.')
          click_on 'Continue'
          find('h4',
               text: 'Now that we have gone over some general concerns')
          answer_question(0)
          find('h4', text: 'You\'ve decided to go ahead with a quit at' \
                           'tempt')
          click_on 'Continue'
          find('h3', text: 'Challenging Times During Your Quit Attempt')
          answer_question(0)
          find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
          click_on 'Continue'
          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          find('h3', text: 'Enlisting Your Social Support')
          find('.btn.btn-info').click
          expect(page).to have_css('#save_button[disabled = disabled]')
          fill_in 'name', with: 'Jane Doe'
          find('#reason').click
          find("option[value = 'He/she will offer encouragement along " \
               "the way.'").click
          find('#save_button').click
          find('#exit_button').click
          find('h3', text: 'Enlisting Your Social Support')
          click_on 'Continue'
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          find('h3', text: 'Splendid!')
          find('#cessation_date_selector').click
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%d') > '26'
            find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
          else
            cessation_date = Date.today + 32
            find('.dw-mon',
                 text: "#{cessation_date.strftime('%B')}").click
            element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
            find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
          end
          find('h3', text: 'Splendid!')
          click_on 'Continue'
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(0)
          find('h4', text: 'It\'s a big step')
          click_on 'Continue'
          find('h3', text: 'Difficult Times To Stay Smoke Free')
          find('.btn.btn-info',
               text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
          find('.btn-group.ng-scope', text: 'Tu').click
          find('#risky_time_time').click
          time = Time.now.strftime('%I:%M')
          if time.between?('10:58', '12:00') ||
             Time.now.strftime('%M') >= '58'
            find('.dwbw.dwb-s').click
            find('.well.modal-well', text: 'Add risky times below.')
            fill_in 'reason', with: 'My reason'
            find('#save_button').click
          else
            risky_time = Time.now + (62 * 60)
            element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
            element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
            find('.dw-i', text: "#{risky_time.strftime('%p')}").click
            fill_in 'reason', with: 'My reason'
            find('#save_button').click
          end

          find('#exit_button').click
          find('h3', text: 'Difficult Times To Stay Smoke Free')
          click_on 'Continue'
          find('h3', text: 'Receiving Reminders To Stay on Track')
          click_on 'Continue'
          find('h3', text: 'Congrats again: You are now all set for yo' \
                           'ur quit day!')
          click_on 'Continue'
          find('h3', text: 'Excellent!')
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%-d') > '26'
            cess_date = "#{Date.today.strftime('%b. %-d')}"
          else
            new_date = Date.today + 32
            cess_date = "#{new_date.strftime('%b. %-d')}"
          end
          find('.question.well', text: cess_date)
          click_on 'Continue'
          find('.btn.btn-primary', text: 'GO HOME').click
          find('h3', text: 'Set Up')
          find('#save_button').click
          expect(page).to have_css('#smokingStatus')
        end

        it 'responds to difficult_1b with 2' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3',
               text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(2)
          find('h3', text: 'Congratulations!')
          click_on 'Continue'
          find('h3', text: 'Your Reasons for Quitting Smoking')
          find('.btn.btn-info').click
          fill_in 'reason', with: 'My reason'
          find('#save_button').click
          find('#exit_button').click
          click_on 'Continue'
          find('h3', text: 'Benefits of Quitting Smoking')
          answer_question(0)
          find('h3', text: 'Healthy Changes Over Time')
          click_on 'Continue'
          find('h3', text: 'Ready to Quit?')
          answer_question(0)
          find('h4', text: 'You are not ready to quit at this time.')
          click_on 'Continue'
          find('h3', text: 'Concerns about Quitting')
          answer_question(0)
          find('h4', text: 'You\'re concerned that you\'ll feel tired ' \
                           'without a cigarette.')
          click_on 'Continue'
          find('h4',
               text: 'Now that we have gone over some general concerns')
          answer_question(0)
          find('h4', text: 'You\'ve decided to go ahead with a quit at' \
                           'tempt')
          click_on 'Continue'
          find('h3', text: 'Challenging Times During Your Quit Attempt')
          answer_question(0)
          find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
          click_on 'Continue'
          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          find('h3', text: 'Enlisting Your Social Support')
          find('.btn.btn-info').click
          expect(page).to have_css('#save_button[disabled = disabled]')
          fill_in 'name', with: 'Jane Doe'
          find('#reason').click
          find("option[value = 'He/she will offer encouragement along " \
               "the way.'").click
          find('#save_button').click
          find('#exit_button').click
          find('h3', text: 'Enlisting Your Social Support')
          click_on 'Continue'
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          find('h3', text: 'Splendid!')
          find('#cessation_date_selector').click
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%d') > '26'
            find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
          else
            cessation_date = Date.today + 32
            find('.dw-mon',
                 text: "#{cessation_date.strftime('%B')}").click
            element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
            find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
          end
          find('h3', text: 'Splendid!')
          click_on 'Continue'
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(0)
          find('h4', text: 'It\'s a big step')
          click_on 'Continue'
          find('h3', text: 'Difficult Times To Stay Smoke Free')
          answer_question(1)
          expect(page)
            .to have_content 'You have chosen not to identify any time' \
                             's you might have difficulty to remain sm' \
                             'oke-free.'
          click_on 'Continue'
          find('h3', text: 'Congrats again: You are now all set for yo' \
                           'ur quit day!')
          click_on 'Continue'
          find('h3', text: 'Excellent!')
          if Date.today.strftime('%B') == 'December' ||
             Date.today.strftime('%-d') > '26'
            cess_date = "#{Date.today.strftime('%b. %-d')}"
          else
            new_date = Date.today + 32
            cess_date = "#{new_date.strftime('%b. %-d')}"
          end
          find('.question.well', text: cess_date)
          click_on 'Continue'
          find('.btn.btn-primary', text: 'GO HOME').click
          find('h3', text: 'Set Up')
          expect(page).to_not have_css('#save_button')
        end
      end
    end

    describe 'responds to \'session1_19b\' with 1, \'social_support\' with 7' do
      it 'sees correct feedback' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired withou' \
                         't a cigarette.')
        click_on 'Continue'
        find('h4', text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        expect(page).to have_content 'You can\'t think of anyone in your l' \
                                     'ife who would support you'
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 3' do
    it 'goes through the correct path' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(2)
      find('h4', text: 'Great, you are ready to prepare for your quit day!')
      click_on 'Continue'
      find('h3', text: 'Preparing for Your Quit Day')
      click_on 'Continue'
      find('h3', text: 'Concerns about Quitting')
      answer_question(0)
      find('h4', text: 'You\'re concerned that you\'ll feel tired without a ' \
                       'cigarette.')
      click_on 'Continue'
      find('h4', text: 'Now that we have gone over some general concerns')
      click_on 'Continue'
      find('h3', text: 'Challenging Times During Your Quit Attempt')
      answer_question(0)
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      click_on 'Continue'
      find('h3', text: 'Additional Strategies')
      click_on 'Continue'
      expect(page).to have_content 'Identify your Social Support'
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 5' do
    it 'sees correct feedback' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(4)
      expect(page).to have_content 'You have already quit smoking,'
    end

    describe 'responds to \'social_support1\' with 1' do
      it 'responds to \'session1_social6\' with 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(4)
        find('.question.well', text: 'You have already quit smoking,')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                         'a cigarette.')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(0)
        find('h3', text: 'Enlisting Your Social Support')
        find('.btn.btn-info').click
        fill_in 'name', with: 'Jane Doe'
        find('#reason').click
        find("option[value = 'He/she will offer encouragement along the way.'")
          .click
        find('#save_button').click
        find('#exit_button').click
        find('h3', text: 'Enlisting Your Social Support')
        click_on 'Continue'
        find('h3', text: 'Difficult Times To Stay Smoke Free')
        expect(page).to have_content 'To help you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 0' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(4)
        find('.question.well', text: 'You have already quit smoking,')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired without ' \
                         'a cigarette.')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(1)
        find('.question.well', text: 'You\'ve decided to do this quit attemp' \
                                     't without any help')
        click_on 'Continue'
        find('h3', text: 'Difficult Times To Stay Smoke Free')
        expect(page).to have_content 'To help you stay smoke-free'
      end
    end

    describe 'responds to \'social_support1\' with 7' do
      it 'sees correct feedback' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired withou' \
                         't a cigarette.')
        click_on 'Continue'
        find('h4', text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        expect(page).to have_content 'You can\'t think of anyone in your l' \
                                     'ife who would support you'
      end

      it 'responds to \'session1_social7\' with 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired withou' \
                         't a cigarette.')
        click_on 'Continue'
        find('h4', text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        find('.question.well', text: 'You can\'t think of anyone in your l' \
                                     'ife who would support you')
        answer_question(0)
        expect(page).to have_content 'Excellent!'

        # add path to home screen
      end

      it 'responds to \'session1_social7\' with 0' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        find('h3', text: 'Your Reasons for Quitting Smoking')
        find('.btn.btn-info').click
        fill_in 'reason', with: 'My reason'
        find('#save_button').click
        find('#exit_button').click
        click_on 'Continue'
        find('h3', text: 'Benefits of Quitting Smoking')
        answer_question(0)
        find('h3', text: 'Healthy Changes Over Time')
        click_on 'Continue'
        find('h3', text: 'Ready to Quit?')
        answer_question(0)
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        find('h3', text: 'Concerns about Quitting')
        answer_question(0)
        find('h4', text: 'You\'re concerned that you\'ll feel tired withou' \
                         't a cigarette.')
        click_on 'Continue'
        find('h4', text: 'Now that we have gone over some general concerns')
        answer_question(0)
        find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
        click_on 'Continue'
        find('h3', text: 'Challenging Times During Your Quit Attempt')
        answer_question(0)
        find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
        click_on 'Continue'
        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        find('.question.well', text: 'You can\'t think of anyone in your l' \
                                     'ife who would support you')
        answer_question(1)
        expect(page).to have_content 'You feel that there is nobody in you' \
                                     'r life who would support your upcomi' \
                                     'ng quit attempt.'

        # add path to home screen
      end
    end
  end

  describe 'responds to question 1 with 3, responds to \'session1_5\' with 6' do
    it 'goes through the correct path' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      find('h3', text: 'Healthy Changes Over Time')
      click_on 'Continue'
      find('h3', text: 'Ready to Quit?')
      answer_question(5)
      expect(page).to have_content 'You have already quit smoking, and are u' \
                                   'sing this app, because you want to make ' \
                                   'sure that you won\'t relapse.'
    end
  end
end
