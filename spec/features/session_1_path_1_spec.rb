# filename: path_1_session_1_spec.rb

# require page objects
require 'pages/session'
require 'pages/session_one'
require 'pages/quit_reason'
require 'pages/modal'
require 'pages/social'
require 'pages/cessation'
require 'pages/risky'
require 'pages/continue'
require 'pages/settings_page'

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
    session.start
    session_one.assert_on_session1_1

    expect(continue).to be_disabled
  end

  it 'responds to question 1 with response 2' do
    session.start
    session_one.assert_on_session1_1
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'You have installed this app, because you a' \
                                 're interested in quitting smoking.'
  end

  it 'responds to question 1 with response 4' do
    session.start
    session_one.assert_on_session1_1
    answer_question_with(4)
    session.move_to_next_slide

    expect(page).to have_content 'That\'s great!'

    session.move_to_next_slide
    session_one.assert_on_session1_reasons
  end

  describe 'responds to question 1 with response 1' do
    it 'is unable to move past \'session1_reasons\' without responding' do
      session.start

      move_from_session1_1_to_reason

      expect(continue).to be_disabled
    end

    it 'is unable to save without responding to \'session1_reasons\'' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      expect(modal).to be_disabled
    end

    it 'sets a Quit Reason' do
      session.start

      move_from_session1_1_to_reason
      modal.open
      quit_reason.create
      modal.save

      expect(quit_reason).to be_visible

      modal.exit
      session_one.assert_on_session1_reasons
    end

    it 'is unable to move past \'session1_benefits\' without responding' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits

      expect(continue).to be_disabled
    end

    it 'responds to \'session1_benefits\' with response 1' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(1)
      session.move_to_next_slide

      expect(page).to have_content 'Healthy Changes Over Time'
    end

    it 'responds to question \'session1_benefits\' with response 2' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'Feel Better'
    end

    it 'responds to question \'session1_benefits\' with response 3' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(3)
      session.move_to_next_slide

      expect(page).to have_content 'Look Better'
    end

    it 'responds to question \'session1_benefits\' with response 4' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(4)
      session.move_to_next_slide

      expect(page).to have_content 'Smell Better'
    end

    it 'responds to question \'session1_benefits\' with response 5' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(5)
      session.move_to_next_slide

      expect(page).to have_content 'Reduce Your Risk of Heart Disease'
    end

    it 'responds to question \'session1_benefits\' with response 6' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(6)
      session.move_to_next_slide

      expect(page).to have_content 'Reduce Your Risk of Cancer'
    end

    it 'responds to question \'session1_benefits\' with response 7' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(7)
      session.move_to_next_slide

      expect(page).to have_content 'Protect Your Family - including your pets!'
    end

    it 'responds to question \'session1_benefits\' with response 8' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(8)
      session.move_to_next_slide

      expect(page).to have_content 'Starting a Family'
    end

    it 'responds to question \'session1_benefits\' with response 9' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(9)
      session.move_to_next_slide

      expect(page).to have_content 'Save Money'
    end

    it 'responds to question \'session1_benefits\' with response 10' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(10)
      session.move_to_next_slide

      expect(page).to have_content 'Be Hassle-Free'
    end

    it 'responds to question \'session1_benefits\' with response 11' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(11)
      session.move_to_next_slide

      expect(page).to have_content 'More in Control'
    end

    it 'responds to question \'session1_benefits\' with response 12' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(12)
      session.move_to_next_slide

      expect(page).to have_content 'Be Guilt-free'
    end

    it 'responds to question \'session1_benefits\' with response 13' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(13)
      session.move_to_next_slide

      expect(page).to have_content 'Protect the Environment'
    end

    it 'responds to question \'session1_benefits\' with response 14' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      session.move_to_next_slide
      session_one.assert_on_session1_benefits
      answer_question_with(14)
      session.move_to_next_slide

      expect(page).to have_content 'Say "no!" to Big Tobacco'
    end

    it 'cannot move past \'session1_5\' without responding' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      move_from_session1_benefits_to_session1_5
      session_one.assert_on_session1_5

      expect(continue).to be_disabled
    end

    it 'responds to \'session1_5\' with response 2' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      move_from_session1_benefits_to_session1_5
      session_one.assert_on_session1_5
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'You are not ready to quit at this time.'
    end

    it 'responds to \'session1_5\' with response 3' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      move_from_session1_benefits_to_session1_5
      session_one.assert_on_session1_5
      answer_question_with(3)
      session.move_to_next_slide
      session_one.assert_on_session1_8
      session.move_to_next_slide
      find('h3', text: 'Preparing for Your Quit Day')
      session.move_to_next_slide
      session_one.assert_on_session1_10
      answer_question_with(1)
      session.move_to_next_slide
      find('h4', text: 'You\'re concerned that you\'ll feel tired without a ' \
                       'cigarette.')
      session.move_to_next_slide
      session_one.assert_on_session1_19
      session.move_to_next_slide
      session_one.assert_on_session1_20
      answer_question_with(1)
      session.move_to_next_slide
      find('h3', text: 'Dealing with Negative Emotions w/o Smoking')
      session.move_to_next_slide
      find('h3', text: 'Additional Strategies')
      session.move_to_next_slide

      expect(page).to have_content 'Identify your Social Support'
    end

    it 'responds to \'session1_5\' with response 4' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      move_from_session1_benefits_to_session1_5
      session_one.assert_on_session1_5
      answer_question_with(4)
      session.move_to_next_slide
      find('h3', text: 'You want to quit right now?')
      session.move_to_next_slide

      expect(page).to have_content 'Preparing for Your Quit Day'
    end

    it 'responds to \'session1_5\' with response 6' do
      session.start

      move_from_session1_1_to_reason
      modal.open

      enter_quit_reason

      move_from_session1_benefits_to_session1_5
      session_one.assert_on_session1_5
      answer_question_with(6)
      session.move_to_next_slide

      expect(page).to have_content 'You have already quit smoking, and are u' \
                                   'sing this app, because you want to make ' \
                                   'sure that you won\'t relapse.'
    end

    describe 'responds to \'session1_5\' with response 1' do
      it 'cannot move past \'session1_10\' without responding' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10

        expect(continue).to be_disabled
      end

      it 'responds to \'session1_10\' with response 1' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'You\'re concerned that you\'ll feel ti' \
                                     'red without a cigarette.'
      end

      it 'responds to \'session1_10\' with response 2' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'You worry that your urges to smoke wil' \
                                     'l be so strong that you won\'t be able' \
                                     ' to stand it.'
      end

      it 'responds to \'session1_10\' with response 3' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'You mentioned that smoking cigarettes ' \
                                     'gives you a lift when you\'re feeling ' \
                                     'down.'
      end

      it 'responds to \'session1_10\' with response 4' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'It\'s hard to quit when others are smo' \
                                     'king around you.'
      end

      it 'responds to \'session1_10\' with response 5' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'You think you won\'t have the willpowe' \
                                     'r to quit smoking.'
      end

      it 'responds to \'session1_10\' with response 6' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'You worry that you\'ll be hungry, eat ' \
                                     'more, or gain weight.'
      end

      it 'responds to \'session1_10\' with response 7' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'You\'ve selected "other".'

        session.set_notes
      end

      it 'responds to \'session1_10\' with response 8' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        session_one.assert_on_session1_10
        answer_question_with(8)
        session.move_to_next_slide

        expect(page).to have_content 'You have no concerns at all about quit' \
                                     'ting smoking...'
      end

      it 'cannot move past \'session1_19b\' without responding' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        session_one.assert_on_session1_19b

        expect(continue).to be_disabled
      end

      it 'responds to \'session1_19b\' with response 1' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        session_one.assert_on_session1_19b
        answer_question_with(1)
        session.move_to_next_slide

        expect(page)
          .to have_content 'You\'ve decided to go ahead with a quit attempt'
      end

      it 'responds to \'session1_19b\' with response 2' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        session_one.assert_on_session1_19b
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'You\'ve decided that now is not the ri' \
                                     'ght time for you to schedule and prepa' \
                                     're for your quit day.'

        # Now assert this ends the session
        session.move_to_next_slide
        session.finish
        settings_page.assert_on_page

        expect(settings_page).to_not have_save_present
      end

      it 'cannot move past \'session1_20\' without responding' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20

        expect(continue).to be_disabled
      end

      it 'responds to \'session1_20\' with response 1' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(1)
        session.move_to_next_slide

        expect(page)
          .to have_content 'Dealing with Negative Emotions w/o Smoking'
      end

      it 'responds to \'session1_20\' with response 2' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Smoke-free Happiness'
      end

      it 'responds to \'session1_20\' with response 3' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Social Situations'
      end

      it 'responds to \'session1_20\' with response 4' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'Drinking Alcohol'
      end

      it 'responds to \'session1_20\' with response 5' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'Breaking the Habit'
      end

      it 'responds to \'session1_20\' with response 6' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'You have selected "other"'

        session.set_notes
      end

      it 'responds to \'session1_20\' with response 7' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        session_one.assert_on_session1_20
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'You have no triggers for smoking.'
      end

      it 'cannot move past \'social_support1\' without responding' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1

        expect(continue).to be_disabled
      end

      it 'responds to \'social_support1\' with response 2' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'
      end

      it 'responds to \'social_support1\' with response 3' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'
      end

      it 'responds to \'social_support1\' with response 4' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'
      end

      it 'responds to \'social_support1\' with response 5' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'
      end

      it 'responds to \'social_support1\' with response 6' do
        session.start

        move_from_session1_1_to_reason
        modal.open

        enter_quit_reason

        move_from_session1_benefits_to_session1_5
        move_from_session1_5_to_session1_10
        move_from_session1_10_to_session1_19b
        move_from_session1_19b_to_session1_20
        move_from_session1_20_to_social_support1
        session_one.assert_on_social_support1
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'You indicated "other"'

        session.set_notes
        session.move_to_next_slide

        expect(page).to have_content 'Excellent!'
      end

      describe 'responds to \'social_support1\' with response 1' do
        it 'cannot move past \'session1_social6\' without responding' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6

          expect(continue).to be_disabled
        end

        it 'responds to \'session1_social6\' with response 2' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'You\'ve decided to do this quit atte' \
                                       'mpt without any help'

          session.move_to_next_slide

          expect(page).to have_content 'Schedule Your Quit Day'
        end

        describe 'responds to \'session1_social6\' with response 1' do
          it 'cannot save without entering a Social Support' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            move_from_social_support1_to_session1_social10a

            session_one.assert_on_session1_social10a
            modal.open
            expect(modal).to be_disabled
          end

          it 'enters a Social Support' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            move_from_session1_5_to_session1_10
            move_from_session1_10_to_session1_19b
            move_from_session1_19b_to_session1_20
            move_from_session1_20_to_social_support1
            move_from_social_support1_to_session1_social10a

            session_one.assert_on_session1_social10a
            modal.open
            expect(modal).to be_disabled
            social_supports.create
            modal.save
            expect(social_supports).to be_visible
            modal.exit
            session_one.assert_on_session1_social10a
          end

          it 'cannot move past \'session1_schedule\' without responding' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_reason_to_supports
            modal.open

            enter_social_supports

            session.move_to_next_slide
            session_one.assert_on_session1_schedule

            expect(continue).to be_disabled
          end

          it 'responds to \'session_schedule\' with 2' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_reason_to_supports
            modal.open

            enter_social_supports

            session.move_to_next_slide
            session_one.assert_on_session1_schedule
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'That\'s ok'

            # assert this finishes the session
            session.move_to_next_slide
            session.finish
            settings_page.assert_on_page

            expect(settings_page).to_not have_save_present
          end

          describe 'responds to \'session1_schedule\' with response 1' do
            it 'cannot move past \'quitday_ready\' without responding' do
              session.start

              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              move_from_supports_to_quit_date

              expect(continue).to be_disabled
            end

            it 'schedules a Quit Day' do
              session.start

              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              session.move_to_next_slide
              session_one.assert_on_session1_schedule
              answer_question_with(1)
              session.move_to_next_slide

              session_one.assert_on_quitday_ready
              cessation_date.open
              cessation_date.pick_date

              expect(cessation_date).to be_visible
            end

            it 'cannot move past \'quitday_scheduled\' without responding' do
              session.start

              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              move_from_supports_to_quit_date

              enter_cessation_date

              session.move_to_next_slide
              session_one.assert_on_quitday_scheduled

              expect(continue).to be_disabled
            end

            it 'responds to \'quitday_scheduled\' with response 2' do
              session.start

              move_from_session1_1_to_reason
              modal.open

              enter_quit_reason

              move_from_reason_to_supports
              modal.open

              enter_social_supports

              move_from_supports_to_quit_date

              enter_cessation_date

              session.move_to_next_slide
              session_one.assert_on_quitday_scheduled
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'Good for you!'

              session.move_to_next_slide

              expect(page).to have_content 'Difficult Times To Stay Smoke Free'
            end

            describe 'responds to \'quitday_scheduled\' with response 1' do
              it 'cannot move past \'difficult_1\' without responding' do
                session.start

                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                move_from_quit_date_to_difficult_1
                session_one.assert_on_difficult_1

                expect(continue).to be_disabled
              end

              it 'responds to \'difficult_1\' with response 2' do
                session.start

                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                move_from_quit_date_to_difficult_1
                session_one.assert_on_difficult_1
                answer_question_with(2)
                session.move_to_next_slide

                expect(page)
                  .to have_content 'You have chosen not to identify any time' \
                                   's you might have difficulty to remain sm' \
                                   'oke-free.'

                session.move_to_next_slide

                expect(page).to have_content 'Congrats again'
              end

              it 'sets a Risky Time' do
                session.start

                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                move_from_quit_date_to_difficult_1
                session_one.assert_on_difficult_1
                session_one.open_risky_times
                risky_times.select_time
                risky_times.set_reason
                risky_times.set_strategy
                modal.save

                expect(risky_times).to be_visible

                modal.exit
                session_one.assert_on_difficult_1
              end

              it 'completes Session 1' do
                session.start

                move_from_session1_1_to_reason
                modal.open

                enter_quit_reason

                move_from_reason_to_supports
                modal.open

                enter_social_supports

                move_from_supports_to_quit_date

                enter_cessation_date

                move_from_quit_date_to_difficult_1
                session_one.assert_on_difficult_1
                session_one.open_risky_times

                enter_risky_times

                session.move_to_next_slide
                session_one.assert_on_difficult2
                session.move_to_next_slide
                session_one.assert_on_ending
                session.move_to_next_slide
                session_one.assert_on_ending2
                cessation_date.assert_on_ending2
                session.move_to_next_slide
                session.finish

                settings_page.assert_on_page
                settings_page.save

                expect(page).to have_css('#smokingStatus')
              end
            end
          end
        end
      end

      describe 'responds to \'social_support1\' with response 7' do
        it 'responds to \'session1_social7\' with response 1' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'Excellent!'
        end

        it 'responds to \'session1_social7\' with response 2' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'You feel that there is nobody in you' \
                                       'r life who would support your upcomi' \
                                       'ng quit attempt.'
        end

        it 'responds to \'session1_social8\' with response 2' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social8
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social9
          session.move_to_next_slide

          expect(page).to have_content 'Schedule Your Quit Day'
        end

        it 'responds to \'session1_social8\' with response 1' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          move_from_session1_5_to_session1_10
          move_from_session1_10_to_session1_19b
          move_from_session1_19b_to_session1_20
          move_from_session1_20_to_social_support1
          session_one.assert_on_social_support1
          answer_question_with(7)
          session.move_to_next_slide
          session_one.assert_on_session1_social7
          answer_question_with(2)
          session.move_to_next_slide
          session_one.assert_on_session1_social8
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social9b
          session.move_to_next_slide

          expect(page).to have_content 'Schedule Your Quit Day'
        end
      end
    end

    describe 'responds to \'session1_5\' with response 5' do
      describe 'responds to \'social_support1\' with response 1' do
        it 'responds to \'session1_social6\' with 1' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          session_one.assert_on_session1_5
          answer_question_with(5)
          session.move_to_next_slide
          session_one.assert_on_session1_8b
          session.move_to_next_slide

          move_from_session1_10_to_session1_19b
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social10a

          expect(page).to have_content 'You have identified people who can h' \
                                       'elp you in your quit attempt'

          # complete session, expect to be taken to settings, can't go to home
          modal.open
          enter_social_supports
          session.move_to_next_slide
          session.finish

          settings_page.assert_on_page

          expect(page).to_not have_css('#save_button')
        end

        it 'responds to \'session1_social6\' with 2' do
          session.start

          move_from_session1_1_to_reason
          modal.open

          enter_quit_reason

          move_from_session1_benefits_to_session1_5
          session_one.assert_on_session1_5
          answer_question_with(5)
          session.move_to_next_slide
          session_one.assert_on_session1_8b
          session.move_to_next_slide

          move_from_session1_10_to_session1_19b
          session_one.assert_on_social_support1
          answer_question_with(1)
          session.move_to_next_slide
          session_one.assert_on_session1_social6
          answer_question_with(2)
          session.move_to_next_slide

          expect(page).to have_content 'You\'ve decided to do this quit atte' \
                                       'mpt without any help from other people.'

          # complete session, expect to be taken to settings, can't go to home
          session.move_to_next_slide
          session.finish

          settings_page.assert_on_page

          expect(page).to_not have_css('#save_button')
        end
      end

      describe 'responds to \'social_suppor1\' with 7' do
        describe 'responds to \'session1_social7\' with 0' do
          it 'responds to \'session1_social8\' with 1' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            session_one.assert_on_session1_5
            answer_question_with(5)
            session.move_to_next_slide
            session_one.assert_on_session1_8b
            session.move_to_next_slide

            move_from_session1_10_to_session1_19b
            session_one.assert_on_social_support1
            answer_question_with(7)
            session.move_to_next_slide
            session_one.assert_on_session1_social7
            answer_question_with(2)
            session.move_to_next_slide
            session_one.assert_on_session1_social8
            answer_question_with(1)
            session.move_to_next_slide

            expect(page).to have_content 'You have decided to try out the qu' \
                                         'itline and/or the online forum'

            session.move_to_next_slide
            session.finish

            expect(settings_page).to_not have_save_present
          end

          it 'responds to \'session1_social8\' with 2' do
            session.start

            move_from_session1_1_to_reason
            modal.open

            enter_quit_reason

            move_from_session1_benefits_to_session1_5
            session_one.assert_on_session1_5
            answer_question_with(5)
            session.move_to_next_slide
            session_one.assert_on_session1_8b
            session.move_to_next_slide

            move_from_session1_10_to_session1_19b
            session_one.assert_on_social_support1
            answer_question_with(7)
            session.move_to_next_slide
            session_one.assert_on_session1_social7
            answer_question_with(2)
            session.move_to_next_slide
            session_one.assert_on_session1_social8
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'You\'ve decided to do this quit at' \
                                         'tempt without any help'

            session.move_to_next_slide
            session.finish

            expect(settings_page).to_not have_save_present
          end
        end
      end
    end
  end
end

def move_from_session1_1_to_reason
  session_one.assert_on_session1_1
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session_one.assert_on_session1_reasons
end

def move_from_session1_benefits_to_session1_5
  session.move_to_next_slide
  session_one.assert_on_session1_benefits
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_benefits1
  session.move_to_next_slide
end

def move_from_session1_5_to_session1_10
  session_one.assert_on_session1_5
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_7
  session.move_to_next_slide
end

def move_from_session1_10_to_session1_19b
  session_one.assert_on_session1_10
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_11
  session.move_to_next_slide
end

def move_from_session1_19b_to_session1_20
  session_one.assert_on_session1_19b
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_19c
  session.move_to_next_slide
end

def move_from_session1_20_to_social_support1
  session_one.assert_on_session1_20
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_21
  session.move_to_next_slide
end

def move_from_social_support1_to_session1_social10a
  session_one.assert_on_social_support1
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_social6
  answer_question_with(1)
  session.move_to_next_slide
end

def move_from_reason_to_supports
  move_from_session1_benefits_to_session1_5
  move_from_session1_5_to_session1_10
  move_from_session1_10_to_session1_19b
  move_from_session1_19b_to_session1_20
  move_from_session1_20_to_social_support1
  move_from_social_support1_to_session1_social10a
  session_one.assert_on_session1_social10a
end

def move_from_supports_to_quit_date
  session.move_to_next_slide
  session_one.assert_on_session1_schedule
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_quitday_ready
end

def move_from_quit_date_to_difficult_1
  session.move_to_next_slide
  session_one.assert_on_quitday_scheduled
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_quitday_scheduled2
  session.move_to_next_slide
end
