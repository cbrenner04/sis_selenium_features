# frozen_string_literal: true
# filename: session_3_spec.rb

# require session_3_helper, this has the `move_from...to` methods
require 'support/session_3_helper'

feature 'Participant navigates to session 3' do
  background do
    visit ENV['Base_URL']
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    navigation.reload
    session.open
  end

  after { navigation.clear_data }

  scenario 'cannot move past \'session3_smokingstatus\' without responding' do
    session_three.assert_on_session3_smokingstatus

    expect(continue).to be_disabled
  end

  scenario 'responds to \'session3_smokingstatus\' with 2' do
    session_three.assert_on_session3_smokingstatus
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'Congratulations on being quit for one week!'
  end

  feature 'responds to \'session3_smokingstatus\' with 1' do
    scenario 'cannot move past \'session3_gottime\' without responding' do
      move_to_session3_gottime

      expect(continue).to be_disabled
    end

    scenario 'responds to \'session3_gottime\' with 2' do
      move_to_session3_gottime
      session_three.assert_on_session3_gottime
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      session.move_to_next_slide

      expect(page).to have_content '7 days since you quit!'
    end

    feature 'responds to \'session3_gottime\' with 1' do
      scenario 'cannot move past \'session3_benefits\' without responding' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits

        expect(continue).to be_disabled
      end

      scenario 'responds to \'session3_benefits\'with 2' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(2)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 3' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 4' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(4)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 5' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(5)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 6' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(6)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 7' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(7)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 8' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(8)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 9' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(9)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 10' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_benefits
        answer_question_with(10)
        session.move_to_next_slide

        expect(page).to have_content 'Here\'s a list of your strategies that' \
                                     ' you came up'
      end

      scenario 'responds to \'session3_benefits\'with 11' do
        move_to_session3_gottime
        move_from_session3_gottime_to_session3_benefits
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

      feature 'responds to \'session3_benefits\' with 1' do
        scenario 'cannot move past \'session3_strategies2\' without ' \
           'responding' do
          move_to_session3_gottime
          move_from_session3_gottime_to_session3_strategies2
          session_three.assert_on_session3_strategies2

          expect(continue).to be_disabled
        end

        scenario 'responds to \'session3_strategies2\' with 1' do
          move_to_session3_gottime
          move_from_session3_gottime_to_session3_strategies2
          session_three.assert_on_session3_strategies2
          answer_question_with(1)
          session.move_to_next_slide

          expect(page).to have_content 'Research has shown that one of the m' \
                                       'ost important things'
        end

        scenario 'responds to \'session3_strategies2\' with 3' do
          move_to_session3_gottime
          move_from_session3_gottime_to_session3_strategies2
          session_three.assert_on_session3_strategies2
          answer_question_with(3)
          session.move_to_next_slide

          expect(page)
            .to have_content 'Challenging Times During Your Quit Attempt'
        end

        feature 'responds to \'session3_strategies2\' with 2' do
          scenario "not move past 'session3_strategiesupdate' wo responding" do
            move_to_session3_gottime
            move_from_session3_gottime_to_session3_strategiesupdate
            session_three.assert_on_session3_strategiesupdate

            expect(continue).to be_disabled
          end

          scenario 'responds to \'session3_strategiesupdate\' with 1' do
            move_to_session3_gottime
            move_from_session3_gottime_to_session3_strategiesupdate
            session_three.assert_on_session3_strategiesupdate
            answer_question_with(1)
            session.move_to_next_slide
            session_three.assert_on_session3_strategiesupdate2

            modal.open
            enter_risky_times
            session.move_to_next_slide

            expect(page).to have_content 'Additional Strategies'
          end

          feature 'responds to \'session3_strategiesupdate\' with 2' do
            scenario "not move past 'session3_strategies2a' with no response" do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
              session_three.assert_on_session3_strategies2a

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session3_strategies2a\' with 2' do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
              session_three.assert_on_session3_strategies2a
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'Smoke-free Happiness'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            scenario 'responds to \'session3_strategies2a\' with 3' do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
              session_three.assert_on_session3_strategies2a
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'Social Situations'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            scenario 'responds to \'session3_strategies2a\' with 4' do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
              session_three.assert_on_session3_strategies2a
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'Drinking Alcohol'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            scenario 'responds to \'session3_strategies2a\' with 5' do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
              session_three.assert_on_session3_strategies2a
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Breaking the Habit'

              session.move_to_next_slide

              expect(page).to have_content 'Additional Strategies'
            end

            scenario 'responds to \'session3_strategies2a\' with 6' do
              move_to_session3_gottime
              move_from_session3_gottime_to_session3_strategies2a
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

            feature 'responds to \'session3_strategies2a\' with 1' do
              scenario 'sees supports listed in \'session3_social_support1\'' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1

                expect(page).to have_content 'Test Smith'
              end

              scenario "not move past 'session3_social_support1' w no resp" do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1

                expect(continue).to be_disabled
              end

              scenario 'responds to \'session3_social_support1\' with 2' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1
                answer_question_with(2)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              scenario 'responds to \'session3_social_support1\' with 3' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1
                answer_question_with(3)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              scenario 'responds to \'session3_social_support1\' with 4' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1
                answer_question_with(4)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              scenario 'responds to \'session3_social_support1\' with 5' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1
                answer_question_with(5)
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              scenario 'responds to \'session3_social_support1\' with 6' do
                move_to_session3_gottime
                move_from_session3_gottime_to_session3_social_support1
                session_three.assert_on_session3_social_support1
                answer_question_with(6)
                session.move_to_next_slide

                expect(page).to have_content 'What other things did your sup' \
                                             'porters do'

                session.set_notes
                session.move_to_next_slide

                expect(page).to have_content 'Social Support Check In'
              end

              feature 'responds to \'session3_social_support1\' with 1' do
                scenario "not move past 'session3_social3' with no response" do
                  move_to_session3_gottime
                  move_from_session3_gottime_to_session3_social3
                  session_three.assert_on_session3_social3

                  expect(continue).to be_disabled
                end

                scenario 'responds to \'session3_social3\' with 2' do
                  move_to_session3_gottime
                  move_from_session3_gottime_to_session3_social3
                  session_three.assert_on_session3_social3
                  answer_question_with(2)
                  session.move_to_next_slide

                  expect(page).to have_content 'We\'re sorry to hear that'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                scenario 'responds to \'session3_social3\' with 3' do
                  move_to_session3_gottime
                  move_from_session3_gottime_to_session3_social3
                  session_three.assert_on_session3_social3
                  answer_question_with(3)
                  session.move_to_next_slide

                  expect(page)
                    .to have_content 'This is definitely an important step'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                scenario 'responds to \'session3_social3\' with 4' do
                  move_to_session3_gottime
                  move_from_session3_gottime_to_session3_social3
                  session_three.assert_on_session3_social3
                  answer_question_with(4)
                  session.move_to_next_slide

                  expect(page).to have_content 'You\'ve decided to do this ' \
                                               'quit attempt without any help'

                  session.move_to_next_slide

                  expect(page).to have_content 'Last week...'
                end

                feature 'responds to \'session3_social3\' with 1' do
                  scenario "not move past 'session3_thinkingtraps' w no resp" do
                    move_to_session3_gottime
                    move_from_session3_gottime_to_session3_thinkingtraps
                    session_three.assert_on_session3_thinkingtraps

                    expect(continue).to be_disabled
                  end

                  feature 'responds to \'session3_thinkingtraps\' with 1' do
                    scenario "responds to 'session3_thinkingtraps1a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps1a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 2' do
                    scenario "responds to 'session3_thinkingtraps2a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps2a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 3' do
                    scenario "responds to 'session3_thinkingtraps3a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps3a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 4' do
                    scenario "responds to 'session3_thinkingtraps4a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps4a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 5' do
                    scenario "responds to 'session3_thinkingtraps5a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps5a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 6' do
                    scenario "responds to 'session3_thinkingtraps6a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps6a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 7' do
                    scenario "responds to 'session3_thinkingtraps7a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps7a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 8' do
                    scenario "responds to 'session3_thinkingtraps8a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps8a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 9' do
                    scenario "responds to 'session3_thinkingtraps9a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps9a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                  feature 'responds to \'session3_thinkingtraps\' with 10' do
                    scenario "responds to 'session3_thinkingtraps10a' with 1" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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

                    scenario "responds to 'session3_thinkingtraps10a' with 2" do
                      move_to_session3_gottime
                      move_from_session3_gottime_to_session3_thinkingtraps
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
                  scenario 'responds to \'session3_checkingin4\' with 1' do
                    move_to_session3_gottime
                    move_from_session3_gottime_to_session3_checkingin4
                    session_three.assert_on_session3_checkingin4
                    answer_question_with(1)
                    session.move_to_next_slide

                    expect(page).to have_content 'That\'s terrific!'

                    session.move_to_next_slide

                    expect(page)
                      .to have_content 'Congrats again: You are one week int' \
                                       'o being a non-smoker!'

                    session.move_to_next_slide

                    expect(page).to have_content '7 days since you quit!'
                  end

                  scenario 'responds to \'session3_checkingin4\' with 2' do
                    move_to_session3_gottime
                    move_from_session3_gottime_to_session3_checkingin4
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

                  scenario 'responds to \'session3_checkingin4\' with 3' do
                    move_to_session3_gottime
                    move_from_session3_gottime_to_session3_checkingin4
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

                  scenario 'responds to \'session3_checkingin4\' with 4' do
                    move_to_session3_gottime
                    move_from_session3_gottime_to_session3_checkingin4
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

  feature 'responds to \'session3_smokingstatus\' with 3' do
    feature 'responds to \'session3_gottime\' with 1' do
      scenario 'responds to \'session3_strategies2\' with 1' do
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        move_from_session3_gottime_to_session3_benefits
        session_three.assert_on_session3_strategies2
        answer_question_with(1)
        session.move_to_next_slide

        expect(page).to have_content 'Social Support Check In'
      end
    end

    feature 'responds to \'session3_strategies2\' with 2' do
      scenario 'responds to \'session3_strategiesupdate\' with 1' do
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        move_from_session3_gottime_to_session3_benefits
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

      scenario 'responds to \'session3_strategiesupdate\' with 2' do
        session_three.assert_on_session3_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_three.assert_on_session3_1a
        session.move_to_next_slide
        session_three.assert_on_session3_reschedulingday
        session.move_to_next_slide
        move_from_session3_gottime_to_session3_benefits
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

    feature 'responds to \'session3_strategies2\' with 2' do
      feature 'responds to \'session3_strategiesupdate\' with 1' do
        feature 'responds to \'session3_social3\' with 1' do
          feature 'responds to \'session3_checkingin4\' with 1' do
            scenario 'completes session 3' do
              session_three.assert_on_session3_smokingstatus
              answer_question_with(3)
              session.move_to_next_slide
              session_three.assert_on_session3_1a
              session.move_to_next_slide
              session_three.assert_on_session3_reschedulingday
              session.move_to_next_slide
              move_from_session3_gottime_to_session3_benefits
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

              expect(page).to have_content 'It\'s Your Quit day!'
            end
          end
        end
      end
    end
  end

  feature 'responds to \'session3_smokingstatus\' with 4' do
    scenario 'responds to \'session3_notquitcontinue\' with 1' do
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

      expect(page).to have_content '7 days since you quit!'
    end

    scenario 'responds to \'session3_notquitcontinue\' with 2' do
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

      expect(page).to have_content '7 days since you quit!'
    end
  end
end
