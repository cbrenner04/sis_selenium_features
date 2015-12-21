# filename: session_2_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'page_objects/session'
require 'page_objects/session_two'
require 'page_objects/continue'
require 'page_objects/modal'
require 'page_objects/risky'
require 'page_objects/social'
require 'page_objects/quit_reason'
require 'page_objects/settings_page'
require 'page_objects/cessation'

describe 'Participant navigates to session 2', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    session.open
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees start page' do
    expect(page).to have_content 'START NOW'
  end

  it 'is unable to move past \'session2_smokingstatus\' without responding' do
    session.start
    session_two.assert_on_session2_smokingstatus

    expect(continue).to be_disabled
  end

  it 'responds to \'session2_smokingstatus\' with response 2' do
    session.start
    session_two.assert_on_session2_smokingstatus
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'Slips can be discouraging...'
  end

  it 'responds to \'session2_smokingstatus\' with response 4' do
    session.start
    session_two.assert_on_session2_smokingstatus
    answer_question_with(4)
    session.move_to_next_slide

    expect(page).to have_content 'Today didn\'t work out, but you are ready ' \
                                 'to try again...'
  end

  describe 'responds to \'session2_smokingstatus\' with response 1' do
    it 'is unable to move past \'got_time\' without responding' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(1)
      session.move_to_next_slide
      session_two.assert_on_session2_1
      session.move_to_next_slide
      session_two.assert_on_got_time

      expect(continue).to be_disabled
    end

    it 'responds to \'got_time\' with response 2' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(1)
      session.move_to_next_slide
      session_two.assert_on_session2_1
      session.move_to_next_slide
      session_two.assert_on_got_time
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      session.move_to_next_slide

      expect(page).to have_content 'Great!'

      # Now assert this finishes the session
      session.move_to_next_slide
      session.finish
      modal.save

      expect(page).to have_content 'It\'s Your Quit day!'
    end

    describe 'responds to \'got_time\' with response 1' do
      it 'is unable to move past \'session2_strategies2\' without responding' do
        session.start
        session_two.assert_on_session2_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_1
        session.move_to_next_slide
        session_two.assert_on_got_time
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_overview
        session.move_to_next_slide

        expect(continue).to be_disabled
      end

      it 'responds to \'session2_strategies2\' with response 2' do
        session.start
        session_two.assert_on_session2_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_1
        session.move_to_next_slide
        session_two.assert_on_got_time
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_overview
        session.move_to_next_slide
        session_two.assert_on_session2_strategies2
        answer_question_with(2)

        enter_risky_times

        session.move_to_next_slide
        expect(page).to have_content 'Update Your Strategies'

        modal.open
        enter_risky_times

        session.move_to_next_slide
        expect(page).to have_content 'Checking in About Your Social Support'
      end

      it 'responds to \'session2_strategies2\' with response 3' do
        session.start
        session_two.assert_on_session2_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_1
        session.move_to_next_slide
        session_two.assert_on_got_time
        answer_question_with(1)
        session.move_to_next_slide
        session_two.assert_on_session2_overview
        session.move_to_next_slide
        session_two.assert_on_session2_strategies2
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Update Your Strategies'
      end

      describe 'responds to \'session2_strategies2\' with response 1' do
        it 'is unable to move past \'session2_social_support_1\' without ' \
           'responding' do
          session.start
          session_two.assert_on_session2_smokingstatus
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_1
          session.move_to_next_slide
          session_two.assert_on_got_time
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_overview
          session.move_to_next_slide
          session_two.assert_on_session2_strategies2
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_stratok
          session.move_to_next_slide

          expect(continue).to be_disabled
        end

        describe 'responds to \'session2_social_support_1\' with response 1' do
          it 'cannot move past \'session2_traps\' without responding' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide

            expect(continue).to be_disabled
          end

          describe 'responds to \'session2_traps\' with response 1' do
            it 'cannot move past \'session2_traps1a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps1a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I can have just one cig' \
                                           'arette\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps1a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I can have just one cig' \
                                           'arette\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 2' do
            it 'cannot move past \'session2_traps2a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(2)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps2a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'There\'s no way I can q' \
                                           'uit smoking\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps2a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'There\'s no way I can q' \
                                           'uit smoking\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 3' do
            it 'cannot move past \'session2_traps3a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(3)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps3a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'All my friends smoke an' \
                                           'd they\'ll think I\'m judging th' \
                                           'em if I quit\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps3a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'All my friends smoke an' \
                                           'd they\'ll think I\'m judging th' \
                                           'em if I quit\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 4' do
            it 'cannot move past \'session2_traps4a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(4)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps4a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I won\'t be able to hav' \
                                           'e as much fun without cigarettes\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Nice work!'

              session.set_notes
            end

            it 'responds to \'session2_traps4a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I won\'t be able to hav' \
                                           'e as much fun without cigarettes\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 5' do
            it 'cannot move past \'session2_traps5a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(5)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps5a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Let\'s try an alternative to the' \
                                           ' thought: \'I\'ve been working h' \
                                           'ard - I deserve a cigarette\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Nice work!'

              session.set_notes
            end

            it 'responds to \'session2_traps5a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Let\'s try an alternative to the' \
                                           ' thought: \'I\'ve been working h' \
                                           'ard - I deserve a cigarette\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 6' do
            it 'cannot move past \'session2_traps6a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps6a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I haven\'t been able to' \
                                           ' quit in the past, so I won\'t b' \
                                           'e able to now\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Nice work!'

              session.set_notes
            end

            it 'responds to \'session2_traps6a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I haven\'t been able to' \
                                           ' quit in the past, so I won\'t b' \
                                           'e able to now\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 7' do
            it 'cannot move past \'session2_traps7a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps7a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(7)
              session.move_to_next_slide

              expect(page).to have_content 'Let\'s try an alternative to the' \
                                           ' thought: \'If I have a slip, I' \
                                           '\'ll end up returning to smoking\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Nice work!'

              session.set_notes
            end

            it 'responds to \'session2_traps7a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(7)
              session.move_to_next_slide

              expect(page).to have_content 'Let\'s try an alternative to the' \
                                           ' thought: \'If I have a slip, I' \
                                           '\'ll end up returning to smoking\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 8' do
            it 'cannot move past \'session2_traps8a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(8)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps8a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(8)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s another way to think abo' \
                                           'ut this thought: \'The only pers' \
                                           'on I\'d be hurting by smoking ag' \
                                           'ain is me\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps8a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(8)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s another way to think abo' \
                                           'ut this thought: \'The only pers' \
                                           'on I\'d be hurting by smoking ag' \
                                           'ain is me\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 9' do
            it 'cannot move past \'session2_traps9a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(9)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps9a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(9)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'Quitting is going to ma' \
                                           'ke me overweight and that\'s unh' \
                                           'ealthy too\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps9a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(9)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'Quitting is going to ma' \
                                           'ke me overweight and that\'s unh' \
                                           'ealthy too\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          describe 'responds to \'session2_traps\' with response 10' do
            it 'cannot move past \'session2_traps10a\' without responding' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(10)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            it 'responds to \'session2_traps10a\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(10)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I don\'t need to plan f' \
                                           'or triggers - I just won\'t smok' \
                                           'e\'?'

              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Great!'

              session.set_notes
            end

            it 'responds to \'session2_traps10a\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(10)
              session.move_to_next_slide

              expect(page).to have_content 'What\'s an alternative to the th' \
                                           'ought: \'I don\'t need to plan f' \
                                           'or triggers - I just won\'t smok' \
                                           'e\'?'

              answer_question_with(2)
              session.move_to_next_slide

              expect(page)
                .to have_content 'What alternative would work best for you?'
            end
          end

          it 'cannot move past \'session2_checkingin4\' without responding' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide

            expect(continue).to be_disabled
          end

          it 'responds to \'session2_checkingin4\' with response 2' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'Hang in there'
          end

          it 'responds to \'session2_checkingin4\' with response 3' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4
            answer_question_with(3)
            session.move_to_next_slide

            expect(page).to have_content 'Yes, you can!'
          end

          it 'responds to \'session2_checkingin4\' with response 4' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4
            answer_question_with(4)
            session.move_to_next_slide

            expect(page).to have_content 'Wonderful to hear that'
          end

          it 'responds to \'session2_end\' with response 1' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4a
            session.move_to_next_slide
            session_two.assert_on_session2_end
            answer_question_with(1)

            enter_quit_reason

            session.move_to_next_slide
            session.finish
            settings_page.save

            expect(page).to have_content 'It\'s Your Quit day!'
          end

          it 'responds to \'session2_end\' with response 3' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_social3a
            session.move_to_next_slide
            session_two.assert_on_session2_think1
            session.move_to_next_slide
            session_two.assert_on_session2_traps
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1a
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_traps1b
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4a
            session.move_to_next_slide
            session_two.assert_on_session2_end
            answer_question_with(3)
            session.move_to_next_slide
            session.finish
            settings_page.save

            expect(page).to have_content 'It\'s Your Quit day!'
          end

          describe 'responds to \'session2_end\' with response 2' do
            it 'responds to \'session2_benefits\' with response 1' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Healthy Changes Over Time'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 2' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'Feel Better'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 3' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'Look Better'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 4' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'Smell Better'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 5' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Reduce Your Risk of Heart Disease'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 6' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(6)
              session.move_to_next_slide

              expect(page).to have_content 'Reduce Your Risk of Cancer'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 7' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(7)
              session.move_to_next_slide

              expect(page)
                .to have_content 'Protect Your Family - including your pets!'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 8' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(8)
              session.move_to_next_slide

              expect(page).to have_content 'Starting a Family'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 9' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(9)
              session.move_to_next_slide

              expect(page).to have_content 'Save Money'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 10' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(10)
              session.move_to_next_slide

              expect(page).to have_content 'Be Hassle-Free'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 11' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(11)
              session.move_to_next_slide

              expect(page).to have_content 'Be More in Control'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 12' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(12)
              session.move_to_next_slide

              expect(page).to have_content 'Be Guilt-Free'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 13' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(13)
              session.move_to_next_slide

              expect(page).to have_content 'Protect the Environment'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            it 'responds to \'session2_benefits\' with response 14' do
              session.start
              session_two.assert_on_session2_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_1
              session.move_to_next_slide
              session_two.assert_on_got_time
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_overview
              session.move_to_next_slide
              session_two.assert_on_session2_strategies2
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_stratok
              session.move_to_next_slide
              session_two.assert_on_session2_social_support_1
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_social3a
              session.move_to_next_slide
              session_two.assert_on_session2_think1
              session.move_to_next_slide
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1a
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_traps1b
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_two.assert_on_session2_checkingin4a
              session.move_to_next_slide
              session_two.assert_on_session2_end
              answer_question_with(2)
              session.move_to_next_slide
              session_two.assert_on_session2_benefits
              answer_question_with(14)
              session.move_to_next_slide

              expect(page).to have_content 'Say "no!" to Big Tobacco'

              session.move_to_next_slide
              session.finish
              settings_page.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end
          end
        end

        describe 'responds to \'session2_social_support_1\' with response 2' do
          it 'responds to \'session2_social3b\' with response 1' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'That\'s unfortunate, and probably ' \
                                         'was no fun to experience.'

            answer_question_with(1)
            enter_social_supports
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end

          it 'responds to \'session2_social3b\' with response 2' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'That\'s unfortunate, and probably ' \
                                         'was no fun to experience.'

            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end
        end

        describe 'responds to \'session2_social_support_1\' with response 3' do
          it 'responds to \'session2_social3c\' with response 1' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(3)
            session.move_to_next_slide

            expect(page).to have_content 'You haven\'t reached out to them yet?'

            answer_question_with(1)
            enter_social_supports
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end

          it 'responds to \'session2_social3c\' with response 2' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(3)
            session.move_to_next_slide

            expect(page).to have_content 'You haven\'t reached out to them yet?'

            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end
        end

        describe 'responds to \'session2_social_support_1\' with response 4' do
          it 'responds to session2_social3d with response 1' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(4)
            session.move_to_next_slide

            expect(page).to have_content 'You\'ve decided to do this quit at' \
                                         'tempt without any help from other ' \
                                         'people.'

            answer_question_with(1)
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end

          it 'responds to session2_social3d with response 2' do
            session.start
            session_two.assert_on_session2_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_1
            session.move_to_next_slide
            session_two.assert_on_got_time
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_overview
            session.move_to_next_slide
            session_two.assert_on_session2_strategies2
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_stratok
            session.move_to_next_slide
            session_two.assert_on_session2_social_support_1
            answer_question_with(4)
            session.move_to_next_slide

            expect(page).to have_content 'You\'ve decided to do this quit at' \
                                         'tempt without any help from other ' \
                                         'people.'

            answer_question_with(2)
            enter_social_supports
            session.move_to_next_slide

            expect(page).to have_content 'Sabotaging Thoughts'
          end
        end
      end
    end
  end

  describe 'responds to \'session2_smokingstatus\' with response 3' do
    it 'responds to \'session2_reschedulingday\' with response 2' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(3)
      session.move_to_next_slide
      session_two.assert_on_session2_reschedulingday
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'What do you want to do now?'
    end

    describe 'responds to session2_reschedulingday with response 1' do
      it 'responds to \'not_quit\' with response 1' do
        session.start
        session_two.assert_on_session2_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_two.assert_on_session2_reschedulingday
        answer_question_with(1)

        cessation_date.pick_date

        session.move_to_next_slide
        session_two.assert_on_not_quit
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'START NOW'
      end

      it 'responds to \'not_quit\' with response 2' do
        session.start
        session_two.assert_on_session2_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_two.assert_on_session2_reschedulingday
        answer_question_with(1)

        cessation_date.pick_date

        session.move_to_next_slide
        session_two.assert_on_not_quit
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Got a few minutes?'
      end
    end
  end

  describe 'responds to \'session2_smokingstatus\' with response 5' do
    it 'responds to \'session2_notready2\' with response 1' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(1)
      session.move_to_next_slide

      expect(page).to have_content 'START NOW'
    end

    it 'responds to \'session2_notready2\' with response 2' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'Got a few minutes?'
    end

    it 'responds to \'session2_notready2\' with response 3' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(3)
      session.move_to_next_slide
      session_two.assert_on_retry_later
      answer_question_with(1)
      session.move_to_next_slide
      session_two.assert_on_retry_later2
      session.move_to_next_slide
      session.finish
      settings_page.save

      expect(page).to have_content 'It\'s Your Quit day!'
    end

    it 'responds to \'session2_notready2\' with response 4' do
      session.start
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(4)
      session.finish
      settings_page.save

      expect(page).to have_content 'It\'s Your Quit day!'
    end
  end
end
