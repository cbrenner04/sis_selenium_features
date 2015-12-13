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
      enter_quit_reason('My reason')
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
      enter_quit_reason('My reason')
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
      find('h4', text: 'You\'re concerned that you\'ll feel tired without a ' \
                       'cigarette.')
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
      enter_quit_reason('My reason')
      que = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
             'out Quitting', 'Now that we have gone over some general concerns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              'a cigarette.', 'You\'ve decided that now is not the right tim' \
              'e for you to schedule and prepare for your quit day.']

      que.zip([3, 3, 3, 4], [0, 0, 0, 1], [3, 4, 4, 4], feed) do |a, x, y, z, b|
        find("h#{x}", text: a)
        answer_question(y)
        find("h#{z}", text: b)
        click_on 'Continue'
      end

      enter_risky_times
      expect(page).to have_content 'Receiving Reminders To Stay on Track'
      # add path to home screen
    end

    it 'responds to \'session1_19b\' with 2, \'difficult_1b\' with 2' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(2)
      find('h3', text: 'Congratulations!')
      click_on 'Continue'
      enter_quit_reason('My reason')
      que = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
             'out Quitting', 'Now that we have gone over some general concerns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              'a cigarette.', 'You\'ve decided that now is not the right tim' \
              'e for you to schedule and prepare for your quit day.']

      que.zip([3, 3, 3, 4], [0, 0, 0, 1], [3, 4, 4, 4], feed) do |a, x, y, z, b|
        find("h#{x}", text: a)
        answer_question(y)
        find("h#{z}", text: b)
        click_on 'Continue'
      end
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
      enter_quit_reason('My reason')
      ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
              'out Quitting', 'Now that we have gone over some general conce' \
              'rns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              ' cigarette.', 'You\'ve decided to go ahead with a quit attempt']

      ques.zip([3, 3, 3, 4], [3, 4, 4, 4], feed) do |a, x, y, b|
        find("h#{x}", text: a)
        answer_question(0)
        find("h#{y}", text: b)
        click_on 'Continue'
      end

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
      enter_quit_reason('My reason')
      ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
              'out Quitting', 'Now that we have gone over some general conce' \
              'rns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              ' cigarette.', 'You\'ve decided to go ahead with a quit attempt']

      ques.zip([3, 3, 3, 4], [3, 4, 4, 4], feed) do |a, x, y, b|
        find("h#{x}", text: a)
        answer_question(0)
        find("h#{y}", text: b)
        click_on 'Continue'
      end

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
      enter_quit_reason('My reason')
      ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
              'out Quitting', 'Now that we have gone over some general conce' \
              'rns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              ' cigarette.', 'You\'ve decided to go ahead with a quit attempt']

      ques.zip([3, 3, 3, 4], [3, 4, 4, 4], feed) do |a, x, y, b|
        find("h#{x}", text: a)
        answer_question(0)
        find("h#{y}", text: b)
        click_on 'Continue'
      end

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
      enter_quit_reason('My reason')
      ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
              'out Quitting', 'Now that we have gone over some general conce' \
              'rns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              ' cigarette.', 'You\'ve decided to go ahead with a quit attempt']

      ques.zip([3, 3, 3, 4], [3, 4, 4, 4], feed) do |a, x, y, b|
        find("h#{x}", text: a)
        answer_question(0)
        find("h#{y}", text: b)
        click_on 'Continue'
      end

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
      enter_quit_reason('My reason')
      ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ab' \
              'out Quitting', 'Now that we have gone over some general conce' \
              'rns']
      feed = ['Healthy Changes Over Time', 'You are not ready to quit at thi' \
              's time.', 'You\'re concerned that you\'ll feel tired without ' \
              ' cigarette.', 'You\'ve decided to go ahead with a quit attempt']

      ques.zip([3, 3, 3, 4], [3, 4, 4, 4], feed) do |a, x, y, b|
        find("h#{x}", text: a)
        answer_question(0)
        find("h#{y}", text: b)
        click_on 'Continue'
      end

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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(1)
        expect(page).to have_content 'You\'ve decided to do this quit attemp' \
                                     't without any help'
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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(0)
        find('h3', text: 'Excellent!')
        answer_question(0)
        enter_social_supports('Jane Doe')
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
          enter_quit_reason('My reason')
          ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concern' \
                  's about Quitting', 'Now that we have gone over some gener' \
                  'al concerns', 'Challenging Times During Your Quit Attempt']
          feed = ['Healthy Changes Over Time', 'You are not ready to quit at' \
                  ' this time.', 'You\'re concerned that you\'ll feel tired ' \
                  'without a cigarette.', 'You\'ve decided to go ahead with ' \
                  'a quit attempt', 'Dealing with Negative Emotions w/o Smok' \
                  'ing']

          ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
            find("h#{x}", text: a)
            answer_question(0)
            find("h#{y}", text: b)
            click_on 'Continue'
          end

          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          enter_social_supports('Jane Doe')
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
          enter_quit_reason('My reason')
          ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concern' \
                  's about Quitting', 'Now that we have gone over some gener' \
                  'al concerns', 'Challenging Times During Your Quit Attempt']
          feed = ['Healthy Changes Over Time', 'You are not ready to quit at' \
                  ' this time.', 'You\'re concerned that you\'ll feel tired ' \
                  'without a cigarette.', 'You\'ve decided to go ahead with ' \
                  'a quit attempt', 'Dealing with Negative Emotions w/o Smok' \
                  'ing']

          ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
            find("h#{x}", text: a)
            answer_question(0)
            find("h#{y}", text: b)
            click_on 'Continue'
          end

          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          enter_social_supports('Jane Doe')
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          enter_cessation_date
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
          enter_quit_reason('My reason')
          ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concern' \
                  's about Quitting', 'Now that we have gone over some gener' \
                  'al concerns', 'Challenging Times During Your Quit Attempt']
          feed = ['Healthy Changes Over Time', 'You are not ready to quit at' \
                  ' this time.', 'You\'re concerned that you\'ll feel tired ' \
                  'without a cigarette.', 'You\'ve decided to go ahead with ' \
                  'a quit attempt', 'Dealing with Negative Emotions w/o Smok' \
                  'ing']

          ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
            find("h#{x}", text: a)
            answer_question(0)
            find("h#{y}", text: b)
            click_on 'Continue'
          end

          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          enter_social_supports('Jane Doe')
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          enter_cessation_date
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
          enter_quit_reason('My reason')
          ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concern' \
                  's about Quitting', 'Now that we have gone over some gener' \
                  'al concerns', 'Challenging Times During Your Quit Attempt']
          feed = ['Healthy Changes Over Time', 'You are not ready to quit at' \
                  ' this time.', 'You\'re concerned that you\'ll feel tired w' \
                  'ithout a cigarette.', 'You\'ve decided to go ahead with a' \
                  ' quit attempt', 'Dealing with Negative Emotions w/o Smoking']

          ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
            find("h#{x}", text: a)
            answer_question(0)
            find("h#{y}", text: b)
            click_on 'Continue'
          end

          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          enter_social_supports('Jane Doe')
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          enter_cessation_date
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(0)
          find('h4', text: 'It\'s a big step')
          click_on 'Continue'
          enter_risky_times
          find('h3', text: 'Receiving Reminders To Stay on Track')
          click_on 'Continue'
          find('h3', text: 'Congrats again: You are now all set for your qui' \
                           't day!')
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
          enter_quit_reason('My reason')
          ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concern' \
                  's about Quitting', 'Now that we have gone over some gener' \
                  'al concerns', 'Challenging Times During Your Quit Attempt']
          feed = ['Healthy Changes Over Time', 'You are not ready to quit at' \
                  ' this time.', 'You\'re concerned that you\'ll feel tired ' \
                  'without a cigarette.', 'You\'ve decided to go ahead with ' \
                  'a quit attempt', 'Dealing with Negative Emotions w/o Smok' \
                  'ing']

          ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
            find("h#{x}", text: a)
            answer_question(0)
            find("h#{y}", text: b)
            click_on 'Continue'
          end

          find('h3', text: 'Identify your Social Support')
          answer_question(0)
          find('h3', text: 'Excellent!')
          answer_question(0)
          enter_social_supports('Jane Doe')
          find('h3', text: 'Schedule Your Quit Day')
          answer_question(0)
          enter_cessation_date
          find('h3', text: 'CONGRATULATIONS!')
          answer_question(0)
          find('h4', text: 'It\'s a big step')
          click_on 'Continue'
          find('h3', text: 'Difficult Times To Stay Smoke Free')
          answer_question(1)
          expect(page)
            .to have_content 'You have chosen not to identify any times you ' \
                             'might have difficulty to remain smoke-free.'
          click_on 'Continue'
          find('h3', text: 'Congrats again: You are now all set for your qui' \
                           't day!')
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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
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
      enter_quit_reason('My reason')
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
      enter_quit_reason('My reason')
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
        enter_quit_reason('My reason')
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
        enter_social_supports('Jane Doe')
        find('h3', text: 'Difficult Times To Stay Smoke Free')
        expect(page).to have_content 'To help you stay smoke-free'
      end

      it 'responds to \'session1_social6\' with 0' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        enter_quit_reason('My reason')
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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        expect(page).to have_content 'You can\'t think of anyone in your lif' \
                                     'e who would support you'
      end

      it 'responds to \'session1_social7\' with 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(2)
        find('h3', text: 'Congratulations!')
        click_on 'Continue'
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        find('.question.well', text: 'You can\'t think of anyone in your lif' \
                                     'e who would support you')
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
        enter_quit_reason('My reason')
        ques = ['Benefits of Quitting Smoking', 'Ready to Quit?', 'Concerns ' \
                'about Quitting', 'Now that we have gone over some general c' \
                'oncerns', 'Challenging Times During Your Quit Attempt']
        feed = ['Healthy Changes Over Time', 'You are not ready to quit at t' \
                'his time.', 'You\'re concerned that you\'ll feel tired with' \
                'out a cigarette.', 'You\'ve decided to go ahead with a quit' \
                ' attempt', 'Dealing with Negative Emotions w/o Smoking']

        ques.zip([3, 3, 3, 4, 3], [3, 4, 4, 4, 3], feed) do |a, x, y, b|
          find("h#{x}", text: a)
          answer_question(0)
          find("h#{y}", text: b)
          click_on 'Continue'
        end

        find('h3', text: 'Identify your Social Support')
        answer_question(6)
        find('.question.well', text: 'You can\'t think of anyone in your lif' \
                                     'e who would support you')
        answer_question(1)
        expect(page).to have_content 'You feel that there is nobody in your ' \
                                     'life who would support your upcoming q' \
                                     'uit attempt.'

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
      enter_quit_reason('My reason')
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
