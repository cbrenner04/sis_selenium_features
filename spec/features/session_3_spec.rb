# filename: session_3_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'page_objects/session_three'
require 'page_objects/session'
require 'page_objects/continue'
require 'page_objects/settings_page'
require 'page_objects/modal'
require 'page_objects/risky'
require 'page_objects/cessation'

describe 'Participant navigates to session 3', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    session.open
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees start page' do
    expect(page).to have_content 'START NOW'
  end

  it 'is unable to move past \'session3_smokingstatus\' without responding' do
    session.start
    session_three.assert_on_session3_smokingstatus

    expect(continue).to be_disabled
  end

  it 'responds to \'session3_smokingstatus\' with response 2' do
    session.start
    session_three.assert_on_session3_smokingstatus
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'Congratulations on being quit for one week!'
  end

  describe 'responds to \'session3_smokingstatus\' with response 1' do
    it 'is unable to move past \'session3_gottime\' without responding' do
      session.start
      session_three.assert_on_session3_smokingstatus
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_1
      session.move_to_next_slide

      expect(continue).to be_disabled
    end

    it 'responds to \'session3_gottime\' with response 2' do
      session.start
      session_three.assert_on_session3_smokingstatus
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_1
      session.move_to_next_slide
      session_three.assert_on_session3_gottime
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      # check date time?

      session.move_to_next_slide
      session.finish
      modal.save

      expect(page).to have_content '7 days since you quit!'
    end

    describe 'responds to \'session3_gottime\' with response 1' do
      it 'is unable to move past \'session3_benefits\' without responding' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits

        expect(continue).to be_disabled
      end

      it 'responds to \'session3_benefits\'with response 2' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 3' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 4' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 5' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 6' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 7' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 8' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(8)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 9' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(9)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 10' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(10)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      it 'responds to \'session3_benefits\'with response 11' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_1
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_benefits
        answer_question_with(11)
        session.move_to_next_slide

        expect(page).to have_content 'What other benefits have you noticed a' \
                                     'bout quitting smoking?'

        session.set_notes
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      describe 'responds to \'session3_benefits\' with response 1' do
        it 'is unable to move past \'session3_strategies2\' without ' \
           'responding' do
          session.start
          session_three.assert_on_session3_smokingstatus
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_1
          session.move_to_next_slide
          session_three.assert_on_session3_gottime
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_strategies2

          expect(continue).to be_disabled
        end

        it 'responds to \'session3_strategies2\' with response 1' do
          session.start
          session_three.assert_on_session3_smokingstatus
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_1
          session.move_to_next_slide
          session_three.assert_on_session3_gottime
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_strategies2
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'Research has shown that one of the m' \
                                       'ost important things'
        end

        it 'responds to \'session3_strategies2\' with response 3' do
          session.start
          session_three.assert_on_session3_smokingstatus
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_1
          session.move_to_next_slide
          session_three.assert_on_session3_gottime
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_benefits
          answer_question_with(1)
          session.move_to_next_slide
          session_three.assert_on_session3_strategies2
          answer_question_with(3)
          session.move_to_next_slide

          expect(page)
            .to have_content 'Challenging Times During Your Quit Attempt'
        end

        describe 'responds to \'session3_strategies2\' with response 2' do
          it 'cannot move past \'session3_strategiesupdate\' w/o responding' do
            session.start
            session_three.assert_on_session3_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_1
            session.move_to_next_slide
            session_three.assert_on_session3_gottime
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_benefits
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_strategies2
            answer_question_with(2)
            session.move_to_next_slide
            session_three.assert_on_session3_strategiesupdate

            expect(continue).to be_disabled
          end

          it 'responds to \'session3_strategiesupdate\' with response 1' do
            session.start
            session_three.assert_on_session3_smokingstatus
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_1
            session.move_to_next_slide
            session_three.assert_on_session3_gottime
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_benefits
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_strategies2
            answer_question_with(2)
            session.move_to_next_slide
            session_three.assert_on_session3_strategiesupdate
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_strategiesupdate2

            modal.open
            enter_risky_times
            session.move_to_next_slide

            expect(page).to have_content 'Additional Strategies'
          end

          describe 'responds to \'session3_strategiesupdate\' with 2' do
            it 'is unable to move past \'session3_strategies2a\' without ' \
               'responding' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a

              expect(continue).to be_disabled
            end

            it 'responds to \'session3_strategies2a\' with response 2' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'Smoke-free Happiness'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            it 'responds to \'session3_strategies2a\' with response 3' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'Social Situations'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            it 'responds to \'session3_strategies2a\' with response 4' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'Drinking Alcohol'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            it 'responds to \'session3_strategies2a\' with response 5' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Breaking the Habit'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            it 'responds to \'session3_strategies2a\' with response 6' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_1
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_benefits
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategiesupdate
              answer_question_with(2)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(6)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2aoth
              session.set_notes
              session.move_to_next_slide

              expect(page).to have_content 'You have selected "other".'

              session.set_notes
              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            describe 'responds to \'session3_strategies2a\' with response 1' do
              it 'sees social support listed in \'session3_social_support1\'' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1

                expect(page).to have_content 'Test Smith'
              end

              it 'cannot move past \'session3_social_support1\' without ' \
                 'responding' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1

                expect(continue).to be_disabled
              end

              it 'responds to \'session3_social_support1\' with response 2' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1
                answer_question_with(2)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              it 'responds to \'session3_social_support1\' with response 3' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1
                answer_question_with(3)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              it 'responds to \'session3_social_support1\' with response 4' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1
                answer_question_with(4)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              it 'responds to \'session3_social_support1\' with response 5' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1
                answer_question_with(5)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              it 'responds to \'session3_social_support1\' with response 6' do
                session.start
                session_three.assert_on_session3_smokingstatus
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_1
                session.move_to_next_slide
                session_three.assert_on_session3_gottime
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_benefits
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategiesupdate
                answer_question_with(2)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2a
                answer_question_with(1)
                session.move_to_next_slide
                session_three.assert_on_session3_strategies2b
                session.move_to_next_slide
                session_three.assert_on_session3_3h
                session.move_to_next_slide
                session_three.assert_on_session3_social_support1
                answer_question_with(6)
                session.move_to_next_slide

                expect(page).to have_content 'What other things did your sup' \
                                             'porters do'

                session.set_notes
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              describe 'responds to \'session3_social_support1\' with 1' do
                it 'cannot move past \'session3_social3\' without responding' do
                  session.start
                  session_three.assert_on_session3_smokingstatus
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_1
                  session.move_to_next_slide
                  session_three.assert_on_session3_gottime
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_benefits
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategiesupdate
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2a
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2b
                  session.move_to_next_slide
                  session_three.assert_on_session3_3h
                  session.move_to_next_slide
                  session_three.assert_on_session3_social_support1
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_social3

                  expect(continue).to be_disabled
                end

                it 'responds to \'session3_social3\' with response 2' do
                  session.start
                  session_three.assert_on_session3_smokingstatus
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_1
                  session.move_to_next_slide
                  session_three.assert_on_session3_gottime
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_benefits
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategiesupdate
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2a
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2b
                  session.move_to_next_slide
                  session_three.assert_on_session3_3h
                  session.move_to_next_slide
                  session_three.assert_on_session3_social_support1
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_social3
                  answer_question_with(2)
                  session.move_to_next_slide

                  expect(page).to have_content 'We\'re sorry to hear that'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                it 'responds to \'session3_social3\' with response 3' do
                  session.start
                  session_three.assert_on_session3_smokingstatus
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_1
                  session.move_to_next_slide
                  session_three.assert_on_session3_gottime
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_benefits
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategiesupdate
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2a
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2b
                  session.move_to_next_slide
                  session_three.assert_on_session3_3h
                  session.move_to_next_slide
                  session_three.assert_on_session3_social_support1
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_social3
                  answer_question_with(3)
                  session.move_to_next_slide

                  expect(page)
                    .to have_content 'This is definitely an important step'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                it 'responds to \'session3_social3\' with response 4' do
                  session.start
                  session_three.assert_on_session3_smokingstatus
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_1
                  session.move_to_next_slide
                  session_three.assert_on_session3_gottime
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_benefits
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategiesupdate
                  answer_question_with(2)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2a
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_strategies2b
                  session.move_to_next_slide
                  session_three.assert_on_session3_3h
                  session.move_to_next_slide
                  session_three.assert_on_session3_social_support1
                  answer_question_with(1)
                  session.move_to_next_slide
                  session_three.assert_on_session3_social3
                  answer_question_with(4)
                  session.move_to_next_slide

                  expect(page).to have_content 'You\'ve decided to do this ' \
                                               'quit attempt without any help'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                describe 'responds to \'session3_social3\' with response 1' do
                  it 'cannot move past \'session3_thinkingtraps\' without ' \
                     'responding' do
                    session.start
                    session_three.assert_on_session3_smokingstatus
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_1
                    session.move_to_next_slide
                    session_three.assert_on_session3_gottime
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_benefits
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategiesupdate
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2b
                    session.move_to_next_slide
                    session_three.assert_on_session3_3h
                    session.move_to_next_slide
                    session_three.assert_on_session3_social_support1
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3a
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinking
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinkingtraps

                    expect(continue).to be_disabled
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 1' do
                    it 'responds to \'session3_thinkingtraps1a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'Quitting was easy at first, but' \
                                         ' now I\'m really stressed and need' \
                                         ' a cigarette\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Nicely done!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps1a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'Quitting was easy at first, but' \
                                         ' now I\'m really stressed and need' \
                                         ' a cigarette\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem - here are some'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 2' do
                    it 'responds to \'session3_thinkingtraps2a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'ve cut down to a safe level ' \
                                         'and can just continue smoking like' \
                                         ' this\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Nicely done!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps2a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'ve cut down to a safe level ' \
                                         'and can just continue smoking like' \
                                         ' this\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem - here are some'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 3' do
                    it 'responds to \'session3_thinkingtraps3a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(3)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I had a slip and I know I\'ll s' \
                                         'moke again if I\'m in the same sit' \
                                         'uation\'? '

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Nicely done!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps3a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(3)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I had a slip and I know I\'ll s' \
                                         'moke again if I\'m in the same sit' \
                                         'uation\'? '

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'We can help you out a bit'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 4' do
                    it 'responds to \'session3_thinkingtraps4a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(4)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'If I don\'t light up with my fr' \
                                         'iends, they\'ll make fun of me or ' \
                                         'pressure me to smoke\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Nicely done!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps4a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(4)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'If I don\'t light up with my fr' \
                                         'iends, they\'ll make fun of me or ' \
                                         'pressure me to smoke\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem - here are some'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 5' do
                    it 'responds to \'session3_thinkingtraps5a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(5)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'m definitely going to smoke ' \
                                         'a cigarette if I drink alcohol\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Great Job!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps5a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(5)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'m definitely going to smoke ' \
                                         'a cigarette if I drink alcohol\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'We can help you out a bit'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 6' do
                    it 'responds to \'session3_thinkingtraps6a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(6)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'My urges for cigarettes are nev' \
                                         'er going to go away\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Great job!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps6a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(6)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'My urges for cigarettes are nev' \
                                         'er going to go away\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem - here are some'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 7' do
                    it 'responds to \'session3_thinkingtraps7a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(7)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I know that if I start smoking ' \
                                         'again, I can just quit after a whi' \
                                         'le\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Great Job!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps7a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(7)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I know that if I start smoking ' \
                                         'again, I can just quit after a whi' \
                                         'le\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem - here are some'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 8' do
                    it 'responds to \'session3_thinkingtraps8a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(8)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'One cigarette won\'t be that ba' \
                                         'd\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Fantastic!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps8a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(8)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'One cigarette won\'t be that ba' \
                                         'd\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'We can help you out a bit'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 9' do
                    it 'responds to \'session3_thinkingtraps9a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(9)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'m missing out on socializing' \
                                         ' because I don\'t smoke\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Fantastic!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps9a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(9)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'I\'m missing out on socializing' \
                                         ' because I don\'t smoke\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem...'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  describe 'responds to \'session3_thinkingtraps\' with 10' do
                    it 'responds to \'session3_thinkingtraps10a\' with 1' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(10)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'My emotions are too much - I\'m' \
                                         ' too irritable/sad/anxious to remai' \
                                         'n quit\'?'

                      answer_question_with(1)
                      session.move_to_next_slide

                      expect(page).to have_content 'Fantastic!'

                      session.set_notes
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end

                    it 'responds to \'session3_thinkingtraps10a\' with 2' do
                      session.start
                      session_three.assert_on_session3_smokingstatus
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_1
                      session.move_to_next_slide
                      session_three.assert_on_session3_gottime
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_benefits
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategiesupdate
                      answer_question_with(2)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2a
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_strategies2b
                      session.move_to_next_slide
                      session_three.assert_on_session3_3h
                      session.move_to_next_slide
                      session_three.assert_on_session3_social_support1
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3
                      answer_question_with(1)
                      session.move_to_next_slide
                      session_three.assert_on_session3_social3a
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinking
                      session.move_to_next_slide
                      session_three.assert_on_session3_thinkingtraps
                      answer_question_with(10)
                      session.move_to_next_slide

                      expect(page)
                        .to have_content 'What\'s an alternative to thinking' \
                                         ' \'My emotions are too much - I\'m' \
                                         ' too irritable/sad/anxious to remai' \
                                         'n quit\'?'

                      answer_question_with(2)
                      session.move_to_next_slide

                      expect(page).to have_content 'No problem...'

                      answer_question_with(rand(1..4))
                      session.move_to_next_slide

                      expect(page).to have_content 'How are things going today'
                    end
                  end

                  # these all complete the session in the same way so only the
                  # first completes
                  it 'responds to \'session3_checkingin4\' with response 1' do
                    session.start
                    session_three.assert_on_session3_smokingstatus
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_1
                    session.move_to_next_slide
                    session_three.assert_on_session3_gottime
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_benefits
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategiesupdate
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2b
                    session.move_to_next_slide
                    session_three.assert_on_session3_3h
                    session.move_to_next_slide
                    session_three.assert_on_session3_social_support1
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3a
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinking
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinkingtraps
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1b
                    session.move_to_next_slide
                    session_three.assert_on_session3_checkingin4
                    answer_question_with(1)
                    session.move_to_next_slide

                    expect(page).to have_content 'That\'s terrific!'

                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Congrats again: You are one week int' \
                                       'o being a non-smoker!'

                    session.move_to_next_slide
                    session.finish
                    settings_page.save

                    expect(page).to have_content '7 days since you quit!'
                  end

                  it 'responds to \'session3_checkingin4\' with response 2' do
                    session.start
                    session_three.assert_on_session3_smokingstatus
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_1
                    session.move_to_next_slide
                    session_three.assert_on_session3_gottime
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_benefits
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategiesupdate
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2b
                    session.move_to_next_slide
                    session_three.assert_on_session3_3h
                    session.move_to_next_slide
                    session_three.assert_on_session3_social_support1
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3a
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinking
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinkingtraps
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1b
                    session.move_to_next_slide
                    session_three.assert_on_session3_checkingin4
                    answer_question_with(2)
                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Giving up something we enjoy doing'

                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'It may not always be easy to quit'

                    answer_question_with(rand(1..11))
                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Congrats again: You are one week int' \
                                       'o being a non-smoker!'
                  end

                  it 'responds to \'session3_checkingin4\' with response 3' do
                    session.start
                    session_three.assert_on_session3_smokingstatus
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_1
                    session.move_to_next_slide
                    session_three.assert_on_session3_gottime
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_benefits
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategiesupdate
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2b
                    session.move_to_next_slide
                    session_three.assert_on_session3_3h
                    session.move_to_next_slide
                    session_three.assert_on_session3_social_support1
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3a
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinking
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinkingtraps
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1b
                    session.move_to_next_slide
                    session_three.assert_on_session3_checkingin4
                    answer_question_with(3)
                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Sometimes, it\'s helpful to remind'

                    answer_question_with(rand(1..11))
                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Congrats again: You are one week int' \
                                       'o being a non-smoker!'
                  end

                  it 'responds to \'session3_checkingin4\' with response 4' do
                    session.start
                    session_three.assert_on_session3_smokingstatus
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_1
                    session.move_to_next_slide
                    session_three.assert_on_session3_gottime
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_benefits
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategiesupdate
                    answer_question_with(2)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_strategies2b
                    session.move_to_next_slide
                    session_three.assert_on_session3_3h
                    session.move_to_next_slide
                    session_three.assert_on_session3_social_support1
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_social3a
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinking
                    session.move_to_next_slide
                    session_three.assert_on_session3_thinkingtraps
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1a
                    answer_question_with(1)
                    session.move_to_next_slide
                    session_three.assert_on_session3_think1b
                    session.move_to_next_slide
                    session_three.assert_on_session3_checkingin4
                    answer_question_with(4)
                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Quitting smoking is absolutely a big'

                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Congrats again: You are one week int' \
                                       'o being a non-smoker!'
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  describe 'responds to \'session3_smokingstatus\' with response 3' do
    describe 'responds to \'session3_gottime\' with response 1' do
      it 'responds to \'session3_strategies2\' with response 1' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_strategies2
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'Social Support Check In'
      end
    end

    describe 'responds to \'session3_strategies2\' with response 2' do
      it 'responds to \'session3_strategiesupdate\' with response 1' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_strategies2
        answer_question_with(2)
        session.move_to_next_slide
        session_three.assert_on_session3_strategiesupdate
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_strategiesupdate2

        modal.open
        enter_risky_times
        session.move_to_next_slide

        expect(page).to have_content 'Additional Strategies'
      end

      it 'responds to \'session3_strategiesupdate\' with response 2' do
        session.start
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        session_three.assert_on_session3_gottime
        answer_question_with(1)
        session.move_to_next_slide
        session_three.assert_on_session3_strategies2
        answer_question_with(2)
        session.move_to_next_slide
        session_three.assert_on_session3_strategiesupdate
        answer_question_with(2)
        session.move_to_next_slide

        expect(page)
          .to have_content 'Challenging Times During Your Quit Attempt'
      end
    end

    describe 'responds to \'session3_strategies2\' with response 2' do
      describe 'responds to \'session3_strategiesupdate\' with response 1' do
        describe 'responds to \'session3_social3\' with response 1' do
          describe 'responds to \'session3_checkingin4\' with response 1' do
            it 'completes session 3' do
              session.start
              session_three.assert_on_session3_smokingstatus
              answer_question_with(3)
              session.move_to_next_slide
              session_three.assert_on_session3_1a
              session.move_to_next_slide
              session_three.assert_on_session3_reschedulingday
              session.move_to_next_slide
              session_three.assert_on_session3_gottime
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2
              answer_question_with(3)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2a
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_strategies2b
              session.move_to_next_slide
              session_three.assert_on_session3_3h
              session.move_to_next_slide
              session_three.assert_on_session3_social3
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_social3a
              session.move_to_next_slide
              session_three.assert_on_session3_thinking
              session.move_to_next_slide
              session_three.assert_on_session3_thinkingtraps
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_think1a
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_think1b
              session.move_to_next_slide
              session_three.assert_on_session3_checkingin4
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_checkingin4a
              session.move_to_next_slide
              session_three.assert_on_session3_schedule
              answer_question_with(1)
              session.move_to_next_slide
              session_three.assert_on_session3_quitday_ready

              enter_cessation_date

              session.move_to_next_slide
              session_three.assert_on_session3_quitday_scheduled

              # check for quit date display

              answer_question_with(rand(1..2))
              session.move_to_next_slide
              session_three.assert_on_session3_ending
              session.move_to_next_slide
              session.finish
              modal.save

              expect(page).to have_content 'It\'s Your Quit day!'
            end
          end
        end
      end
    end
  end

  describe 'responds to \'session3_smokingstatus\' with response 4' do
    it 'responds to \'session3_notquitcontinue\' with response 1' do
      session.start
      session_three.assert_on_session3_smokingstatus
      answer_question_with(4)
      session.move_to_next_slide
      session_three.assert_on_session3_notinterested
      session.move_to_next_slide
      session_three.assert_on_session3_notquitcontinue
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_notready
      session.move_to_next_slide
      session_three.assert_on_session3_strategies2
      answer_question_with(3)
      session.move_to_next_slide
      session_three.assert_on_session3_strategies2a
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_strategies2b
      session.move_to_next_slide
      session_three.assert_on_session3_3h
      session.move_to_next_slide
      session_three.assert_on_session3_social3
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_social3a
      session.move_to_next_slide
      session_three.assert_on_session3_checkingin4
      answer_question_with(1)
      session.move_to_next_slide
      session_three.assert_on_session3_checkingin4a
      session.move_to_next_slide
      session_three.assert_on_session3_quitday_not_ready
      session.move_to_next_slide
      session_three.assert_on_session3_ending
      session.move_to_next_slide
      session.finish
      modal.save

      expect(page).to have_content '7 days since you quit!'
    end

    it 'responds to \'session3_notquitcontinue\' with response 2' do
      session.start
      session_three.assert_on_session3_smokingstatus
      answer_question_with(4)
      session.move_to_next_slide
      session_three.assert_on_session3_notinterested
      session.move_to_next_slide
      session_three.assert_on_session3_notquitcontinue
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      session.move_to_next_slide
      session.finish
      modal.save

      expect(page).to have_content '7 days since you quit!'
    end
  end
end
