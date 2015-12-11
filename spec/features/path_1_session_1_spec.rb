# filename: new_first_session_spec.rb

describe 'Participant loads app for the first time', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees first session' do
    expect(page).to have_content 'START NOW'
  end

  it 'is unable to move forward from question 1 without responding' do
    find('.btn.btn-primary', text: 'START NOW').click
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
  end

  it 'responds to question 1 with response 2'

  it 'responds to question 1 with response 4'

  describe 'responds to question 1 with response 1' do
    it 'is unable to move past \'session1_reasons\' without responding' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
    end

    it 'is unable to save without responding to \'session1_reasons\'' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      expect(page).to have_css('#save_button[disabled = disabled]')
    end

    it 'responds to \'session1_reasons\'' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      within('.well.modal-well') do
        expect(page).to have_content 'My reason'
        expect(page).to have_css '.glyphicon.glyphicon-remove.glyphicon-sm'
      end

      find('#exit_button').click
      find('h3', text: 'Your Reasons for Quitting Smoking')
    end

    it 'is unable to move past \'session1_benefits\' without responding' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
    end

    it 'responds to \'session1_benefits\' with response 1' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(0)
      expect(page).to have_content 'Healthy Changes Over Time'
    end

    it 'responds to question \'session1_benefits\' with response 2' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(1)
      expect(page).to have_content 'Feel Better'
    end

    it 'responds to question \'session1_benefits\' with response 3' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(2)
      expect(page).to have_content 'Look Better'
    end

    it 'responds to question \'session1_benefits\' with response 4' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(3)
      expect(page).to have_content 'Smell Better'
    end

    it 'responds to question \'session1_benefits\' with response 5' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(4)
      expect(page).to have_content 'Reduce Your Risk of Heart Disease'
    end

    it 'responds to question \'session1_benefits\' with response 6' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(5)
      expect(page).to have_content 'Reduce Your Risk of Cancer'
    end

    it 'responds to question \'session1_benefits\' with response 7' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(6)
      expect(page).to have_content 'Protect Your Family - including your pets!'
    end

    it 'responds to question \'session1_benefits\' with response 8' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(7)
      expect(page).to have_content 'Starting a Family'
    end

    it 'responds to question \'session1_benefits\' with response 9' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(8)
      expect(page).to have_content 'Save Money'
    end

    it 'responds to question \'session1_benefits\' with response 10' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(9)
      expect(page).to have_content 'Be Hassle-Free'
    end

    it 'responds to question \'session1_benefits\' with response 11' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(10)
      expect(page).to have_content 'More in Control'
    end

    it 'responds to question \'session1_benefits\' with response 12' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(11)
      expect(page).to have_content 'Be Guilt-free'
    end

    it 'responds to question \'session1_benefits\' with response 13' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(12)
      expect(page).to have_content 'Protect the Environment'
    end

    it 'responds to question \'session1_benefits\' with response 14' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
      click_on 'Continue'
      find('h3', text: 'Your Reasons for Quitting Smoking')
      find('.btn.btn-info').click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      find('#exit_button').click
      click_on 'Continue'
      find('h3', text: 'Benefits of Quitting Smoking')
      answer_question(13)
      expect(page).to have_content 'Say "no!" to Big Tobacco'
    end

    it 'cannot move past \'session1_5\' without responding' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are interes' \
                       'ted in quitting smoking.')
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
      expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
    end

    it 'responds to \'session1_5\' with response 2' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are intere' \
                       'sted in quitting smoking.')
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
      answer_question(1)
      expect(page).to have_content 'You are not ready to quit at this time.'
    end

    it 'responds to \'session1_5\' with response 3' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are intere' \
                       'sted in quitting smoking.')
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
      find('h4', text: 'You\'ve decided to go ahead with a quit attempt')
      answer_question(1)
      find('h3', text: 'Smoke-free Happiness')
      click_on 'Continue'
      find('h3', text: 'Additional Strategies')
      click_on 'Continue'
      expect(page).to have_content 'Identify your Social Support'
    end

    it 'responds to \'session1_5\' with response 4' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are intere' \
                       'sted in quitting smoking.')
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
      answer_question(3)
      find('h3', text: 'You want to quit right now?')
      click_on 'Continue'
      expect(page).to have_content 'Preparing for Your Quit Day'
    end

    it 'responds to \'session1_5\' with response 6' do
      find('.btn.btn-primary', text: 'START NOW').click
      find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
      answer_question(0)
      find('h4', text: 'You have installed this app, because you are intere' \
                       'sted in quitting smoking.')
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

    describe 'responds to \'session1_5\' with response 1' do
      it 'sees the correct feedback' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'cannot move past \'session1_10\' without responding' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page)
          .to have_css('button[disabled = disabled]', text: 'CONTINUE')
      end

      it 'responds to \'session1_10\' with response 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page).to have_content 'You\'re concerned that you\'ll feel ti' \
                                     'red without a cigarette.'
      end

      it 'responds to \'session1_10\' with response 2' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(1)
        expect(page).to have_content 'You worry that your urges to smoke wil' \
                                     'l be so strong that you won\'t be able' \
                                     ' to stand it.'
      end

      it 'responds to \'session1_10\' with response 3' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(2)
        expect(page).to have_content 'You mentioned that smoking cigarettes ' \
                                     'gives you a lift when you\'re feeling ' \
                                     'down.'
      end

      it 'responds to \'session1_10\' with response 4' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(3)
        expect(page).to have_content 'It\'s hard to quit when others are smo' \
                                     'king around you.'
      end

      it 'responds to \'session1_10\' with response 5' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        click_on 'Continue'
        find('h4', text: 'You are not ready to quit at this time.')
        click_on 'Continue'
        answer_question(4)
        expect(page).to have_content 'You think you won\'t have the willpowe' \
                                     'r to quit smoking.'
      end

      it 'responds to \'session1_10\' with response 6' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(5)
        expect(page).to have_content 'You worry that you\'ll be hungry, eat ' \
                                     'more, or gain weight.'
      end

      it 'responds to \'session1_10\' with response 7' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(6)
        expect(page).to have_content 'You\'ve selected "other".'
      end

      it 'responds to \'session1_10\' with response 8' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(7)
        expect(page).to have_content 'You have no concerns at all about quit' \
                                     'ting smoking...'
      end

      it 'cannot move past \'session1_19b\' without responding' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page)
          .to have_css('button[disabled = disabled]', text: 'CONTINUE')
      end

      it 'responds to \'session1_19b\' with response 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'responds to \'session1_19b\' with response 2' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
      end

      it 'cannot move past \'session1_20\' without responding' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page)
          .to have_css('button[disabled = disabled]', text: 'CONTINUE')
      end

      it 'responds to \'session1_20\' with response 1' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page)
          .to have_content 'Dealing with Negative Emotions w/o Smoking'
      end

      it 'responds to \'session1_20\' with response 2' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(1)
        expect(page).to have_content 'Smoke-free Happiness'
      end

      it 'responds to \'session1_20\' with response 3' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(2)
        expect(page).to have_content 'Social Situations'
      end

      it 'responds to \'session1_20\' with response 4' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(3)
        expect(page).to have_content 'Drinking Alcohol'
      end

      it 'responds to \'session1_20\' with response 5' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(4)
        expect(page).to have_content 'Breaking the Habit'
      end

      it 'responds to \'session1_20\' with response 6' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(5)
        expect(page).to have_content 'You have selected "other"'
      end

      it 'responds to \'session1_20\' with response 7' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        answer_question(6)
        expect(page).to have_content 'You have no triggers for smoking.'
      end

      it 'cannot move past \'social_support1\' without responding' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        expect(page)
          .to have_css('button[disabled = disabled]', text: 'CONTINUE')
      end

      it 'responds to \'social_support1\' with response 2' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'responds to \'social_support1\' with response 3' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'responds to \'social_support1\' with response 4' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'responds to \'social_support1\' with response 5' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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

      it 'responds to \'social_support1\' with response 6' do
        find('.btn.btn-primary', text: 'START NOW').click
        find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
        answer_question(0)
        find('h4', text: 'You have installed this app, because you are intere' \
                         'sted in quitting smoking.')
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
        # there should be a place to enter text, waiting for css
        click_on 'Continue'
        expect(page).to have_content 'Excellent!'
      end

      describe 'responds to \'social_support1\' with response 1' do
        it 'cannot move past \'session1_social6\' without responding' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are int' \
                           'erested in quitting smoking.')
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
          expect(page)
            .to have_css('button[disabled = disabled]', text: 'CONTINUE')
        end

        it 'responds to \'session1_social6\' with response 2' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are int' \
                           'erested in quitting smoking.')
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

        it 'responds to \'session1_social6\' with response 2, skips social ' \
           'supports modal, goes straight to \'session1_schedule\'' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are int' \
                           'erested in quitting smoking.')
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
          find('h4', text: 'You\'ve decided to do this quit attempt without ' \
                           'any help')
          click_on 'Continue'
          expect(page).to have_content 'Schedule Your Quit Day'
        end

        describe 'responds to \'session1_social6\' with response 1' do
          it 'sees correct feedback' do
            find('.btn.btn-primary', text: 'START NOW').click
            find('h3',
                 text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
            answer_question(0)
            find('h4', text: 'You have installed this app, because you are i' \
                             'nterested in quitting smoking.')
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
            expect(page).to have_content 'Enlisting Your Social Support'
            expect(page).to have_content 'You have identified people who can' \
                                         ' help you in your quit attempt'
          end

          it 'cannot save without entering a Social Support' do
            find('.btn.btn-primary', text: 'START NOW').click
            find('h3',
                 text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
            answer_question(0)
            find('h4', text: 'You have installed this app, because you are i' \
                             'nterested in quitting smoking.')
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
            expect(page).to have_css('#save_button[disabled = disabled]')
          end

          it 'enters a Social Support' do
            find('.btn.btn-primary', text: 'START NOW').click
            find('h3',
                 text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
            answer_question(0)
            find('h4', text: 'You have installed this app, because you are i' \
                             'nterested in quitting smoking.')
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
            expect(page).to have_css('#save_button[disabled = disabled]')
            fill_in 'name', with: 'Jane Doe'
            find('#reason').click
            find("option[value = 'He/she will offer encouragement along the way.'")
              .click
            find('#save_button').click
            within('.well.modal-well') do
              expect(page).to have_content "Jane Doe\nHe/she will offer enco" \
                                           'uragement along the way.'
              expect(page).to have_css '.glyphicon-remove.glyphicon-sm'
            end

            find('#exit_button').click
            find('h3', text: 'Enlisting Your Social Support')
          end

          it 'cannot move past \'session1_schedule\' without responding' do
            find('.btn.btn-primary', text: 'START NOW').click
            find('h3',
                 text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
            answer_question(0)
            find('h4', text: 'You have installed this app, because you are i' \
                             'nterested in quitting smoking.')
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
            expect(page).to have_css('#save_button[disabled = disabled]')
            fill_in 'name', with: 'Jane Doe'
            find('#reason').click
            find("option[value = 'He/she will offer encouragement along the way.'")
              .click
            find('#save_button').click
            find('#exit_button').click
            find('h3', text: 'Enlisting Your Social Support')
            click_on 'Continue'
            find('h3', text: 'Schedule Your Quit Day')
            expect(page)
              .to have_css('button[disabled = disabled]', text: 'CONTINUE')
          end

          it 'responds to \'session_schedule\' with 0' do
            find('.btn.btn-primary', text: 'START NOW').click
            find('h3',
                 text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
            answer_question(0)
            find('h4', text: 'You have installed this app, because you are i' \
                             'nterested in quitting smoking.')
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
            expect(page).to have_css('#save_button[disabled = disabled]')
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

          describe 'responds to \'session1_schedule\' with response 1' do
            it 'sees correct feedback' do
              find('.btn.btn-primary', text: 'START NOW').click
              find('h3',
                   text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
              answer_question(0)
              find('h4', text: 'You have installed this app, because you are' \
                               ' interested in quitting smoking.')
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

            it 'cannot move past \'quitday_ready\' without responding' do
              find('.btn.btn-primary', text: 'START NOW').click
              find('h3',
                   text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
              answer_question(0)
              find('h4', text: 'You have installed this app, because you are' \
                               ' interested in quitting smoking.')
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
              expect(page)
                .to have_css('button[disabled = disabled]', text: 'CONTINUE')
            end

            it 'schedules a quit date' do
              find('.btn.btn-primary', text: 'START NOW').click
              find('h3',
                   text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
              answer_question(0)
              find('h4', text: 'You have installed this app, because you are' \
                               ' interested in quitting smoking.')
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
                expect(page)
                  .to have_content 'Cessation date scheduled for: ' \
                                   "#{Date.today.strftime('%m/%d/%Y')}"
              else
                cessation_date = Date.today + 32
                find('.dw-mon', text: "#{cessation_date.strftime('%B')}").click
                element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
                find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
                expect(page)
                  .to have_content 'Cessation date scheduled for: ' \
                                  "#{cessation_date.strftime('%m/%d/%Y')}"
              end
            end

            it 'cannot move past \'quitday_scheduled\' without responding' do
              find('.btn.btn-primary', text: 'START NOW').click
              find('h3',
                   text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
              answer_question(0)
              find('h4', text: 'You have installed this app, because you are' \
                               ' interested in quitting smoking.')
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
              expect(page)
                .to have_css('button[disabled = disabled]', text: 'CONTINUE')
            end

            it 'responds to \'quitday_scheduled\' with reponse 0' do
              find('.btn.btn-primary', text: 'START NOW').click
              find('h3',
                   text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
              answer_question(0)
              find('h4', text: 'You have installed this app, because you are' \
                               ' interested in quitting smoking.')
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

            describe 'responds to \'quitday_scheduled\' with response 1' do
              it 'sees correct feedback' do
                find('.btn.btn-primary', text: 'START NOW').click
                find('h3',
                     text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
                answer_question(0)
                find('h4', text: 'You have installed this app, because you a' \
                                 're interested in quitting smoking.')
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

              it 'cannot move past \'difficult_1\' without responding' do
                find('.btn.btn-primary', text: 'START NOW').click
                find('h3',
                     text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
                answer_question(0)
                find('h4', text: 'You have installed this app, because you a' \
                                 're interested in quitting smoking.')
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
                expect(page)
                  .to have_css('button[disabled = disabled]', text: 'CONTINUE')
              end

              it 'responds to \'difficult_1\' with response 0' do
                find('.btn.btn-primary', text: 'START NOW').click
                find('h3',
                     text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
                answer_question(0)
                find('h4', text: 'You have installed this app, because you a' \
                                 're interested in quitting smoking.')
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
              end

              it 'sets a risky time' do
                find('.btn.btn-primary', text: 'START NOW').click
                find('h3',
                     text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
                answer_question(0)
                find('h4', text: 'You have installed this app, because you a' \
                                 're interested in quitting smoking.')
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
                  within('.well.modal-well') do
                    expect(page)
                      .to have_content "#{Time.now.strftime('%l:%M %p')}" \
                                       " - Tuesday\nMy reason"
                    expect(page).to have_css '.glyphicon-remove.glyphicon-sm'
                  end
                else
                  risky_time = Time.now + (62 * 60)
                  element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
                  element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
                  find('.dw-i', text: "#{risky_time.strftime('%p')}").click
                  fill_in 'reason', with: 'My reason'
                  find('#save_button').click
                  within('.well.modal-well') do
                    expect(page)
                      .to have_content "#{risky_time.strftime('%l:%M %p')}" \
                                       " - Tuesday\nMy reason"
                    expect(page).to have_css '.glyphicon-remove.glyphicon-sm'
                  end
                end

                find('.close').click
                find('h3', text: 'Difficult Times To Stay Smoke Free')
              end

              it 'completes Session 1' do
                find('.btn.btn-primary', text: 'START NOW').click
                find('h3',
                     text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
                answer_question(0)
                find('h4', text: 'You have installed this app, because you a' \
                                 're interested in quitting smoking.')
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
                find('.close').click
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
                expect(page).to have_css('#smokingStatus')
              end
            end
          end
        end
      end

      describe 'responds to \'social_support1\' with response 7' do
        it 'sees correct feedback' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are inte' \
                           'rested in quitting smoking.')
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

        it 'responds to \'session1_social7\' with response 1' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are inte' \
                           'rested in quitting smoking.')
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
        end

        it 'responds to \'session1_social7\' with response 0' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are inte' \
                           'rested in quitting smoking.')
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
          expect(page).to have_content 'You feel there is nobody in your lif' \
                                       'e who would support your upcoming qu' \
                                       'it attempt.'
        end

        it 'responds to \'session1_social8\' with response 0' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are inte' \
                           'rested in quitting smoking.')
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
          find('.question.well', text: 'You feel there is nobody in your lif' \
                                       'e who would support your upcoming qu' \
                                       'it attempt.')
          answer_question(1)
          find('h4', text: 'You\'ve decided to do this quit attempt without ' \
                           'any help from other people.')
          click_on 'Continue'
          expect(page).to have_content 'Schedule Your Quit Day'
        end

        it 'responds to \'session1_social8\' with response 1' do
          find('.btn.btn-primary', text: 'START NOW').click
          find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
          answer_question(0)
          find('h4', text: 'You have installed this app, because you are inte' \
                           'rested in quitting smoking.')
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
          find('.question.well', text: 'You feel there is nobody in your lif' \
                                       'e who would support your upcoming qu' \
                                       'it attempt.')
          answer_question(0)
          find('h4', text: 'You have decided to try out the quitline and/or ' \
                           'the online forum.')
          click_on 'Continue'
          expect(page).to have_content 'Schedule Your Quit Day'
        end
      end
    end
  end

  describe 'is taken to the configuration page when session is complete but ' \
           'all modals have not been responded to' do
    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 1,' do
      it 'responds to \'session1_19b\' with response 2'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 1, and \'social_support1\' with 7' do
      it 'responds to \'session1_social7\' with response 1'
      it 'responds to \'session1_social7\' with response 0'
      it 'responds to \'session1_social8\' with response 0'
      it 'responds to \'session1_social8\' with response 1'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 5, and \'social_support1\' with response 1' do
      it 'responds to \'session1_social6\' with 1'
      it 'responds to \'session1_social6\' with 0'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 5, and \'social_support1\' with response 7' do
      it 'responds to \'session1_social7\' with 1'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 5, \'social_suppor1\' with 7, \'session1_social7\' with' \
             ' 0' do
      it 'responds to \'session1_social8\' with 1'
      it 'responds to \'session1_social8\' with 0'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 1, \'social_support1\' with 1, \'session1_social\' with' \
             ' 1,' do
      it 'responds to \'session1_schedule\' with 0'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 1, \'social_support1\' with 1, \'session1_social6\' wit' \
             'h 1, \'session1_schedule\' with 1' do
      it 'responds to \'quitday_scheduled\' with response 0'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 1, \'social_support1\' with 1, \'session1_social6\' wit' \
             'h 1, \'session1_schedule\' with 1, \'quitday_scheduled\' with ' \
             '1' do
      it 'responds to \'difficult_1\' with response 0'
    end

    describe 'responds to question 1 with response 1, \'session1_5\' with re' \
             'sponse 5, \'social_support1\' with 1, ' do
      it 'responds to \'session1_social6\' with response 1'
      it 'responds to \'session1_social6\' with response 0'
    end
  end
end
