# frozen_string_literal: true
# filename: session_2_spec.rb

# require session_2_helper, this has the `move_from...to` methods
require 'support/session_2_helper'

feature 'Participant navigates to session 2' do
  background do
    visit ENV['Base_URL']
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    navigation.reload
    session.open
  end

  after { navigation.clear_data }

  scenario "is unable to move past 'session2_smokingstatus' with no response" do
    session_two.assert_on_session2_smokingstatus

    expect(continue).to be_disabled
  end

  scenario 'responds to \'session2_smokingstatus\' with response 2' do
    session_two.assert_on_session2_smokingstatus
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'Slips can be discouraging...'
  end

  scenario 'responds to \'session2_smokingstatus\' with response 4' do
    session_two.assert_on_session2_smokingstatus
    answer_question_with(4)
    session.move_to_next_slide

    expect(page).to have_content 'Today didn\'t work out, but you are ready ' \
                                 'to try again...'
  end

  feature 'responds to \'session2_smokingstatus\' with response 1' do
    scenario 'is unable to move past \'got_time\' without responding' do
      move_to_got_time
      session_two.assert_on_got_time

      expect(continue).to be_disabled
    end

    scenario 'responds to \'got_time\' with response 2' do
      move_to_got_time
      session_two.assert_on_got_time
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      session.move_to_next_slide

      expect(page).to have_content 'It\'s Your Quit day!'
    end

    feature 'responds to \'got_time\' with response 1' do
      scenario 'cannot move past \'session2_strategies2\' with no response' do
        move_to_got_time
        move_from_got_time_to_session2_strategies2

        expect(continue).to be_disabled
      end

      scenario 'responds to \'session2_strategies2\' with response 2' do
        move_to_got_time
        move_from_got_time_to_session2_strategies2
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

      scenario 'responds to \'session2_strategies2\' with response 3' do
        move_to_got_time
        move_from_got_time_to_session2_strategies2
        session_two.assert_on_session2_strategies2
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Update Your Strategies'
      end

      feature 'responds to \'session2_strategies2\' with response 1' do
        scenario "sees social supports listed in 'session2_social_support_1'" do
          move_to_got_time
          move_from_got_time_to_session2_strategies2
          session_two.assert_on_session2_strategies2
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_stratok
          session.move_to_next_slide

          expect(page).to have_content 'Test Smith'
        end

        scenario "not move past 'session2_social_support_1' with no response" do
          move_to_got_time
          move_from_got_time_to_session2_strategies2
          session_two.assert_on_session2_strategies2
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_stratok
          session.move_to_next_slide

          expect(continue).to be_disabled
        end

        feature 'responds to \'session2_social_support_1\' with response 1' do
          scenario 'cannot move past \'session2_traps\' without responding' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps

            expect(continue).to be_disabled
          end

          feature 'responds to \'session2_traps\' with response 1' do
            scenario "not move past 'session2_traps1a' without no response" do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps1a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps1a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 2' do
            scenario 'not move past \'session2_traps2a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(2)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps2a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps2a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 3' do
            scenario 'not move past \'session2_traps3a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(3)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps3a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps3a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 4' do
            scenario 'not move past \'session2_traps4a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(4)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps4a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps4a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 5' do
            scenario 'not move past \'session2_traps5a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(5)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps5a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps5a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 6' do
            scenario 'not move past \'session2_traps6a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps6a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps6a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 7' do
            scenario 'not move past \'session2_traps7a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps7a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps7a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 8' do
            scenario 'not move past \'session2_traps8a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(8)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps8a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps8a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 9' do
            scenario 'not move past \'session2_traps9a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(9)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps9a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps9a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          feature 'responds to \'session2_traps\' with response 10' do
            scenario 'not move past \'session2_traps10a\' without responding' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(10)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps10a\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

            scenario 'responds to \'session2_traps10a\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
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

          scenario "not move past 'session2_checkingin4' without responding" do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4

            expect(continue).to be_disabled
          end

          scenario 'responds to \'session2_checkingin4\' with response 2' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4
            session_two.assert_on_session2_checkingin4
            answer_question_with(2)
            session.move_to_next_slide

            expect(page).to have_content 'Hang in there'
          end

          scenario 'responds to \'session2_checkingin4\' with response 3' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4
            session_two.assert_on_session2_checkingin4
            answer_question_with(3)
            session.move_to_next_slide

            expect(page).to have_content 'Yes, you can!'
          end

          scenario 'responds to \'session2_checkingin4\' with response 4' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4
            session_two.assert_on_session2_checkingin4
            answer_question_with(4)
            session.move_to_next_slide

            expect(page).to have_content 'Wonderful to hear that'
          end

          scenario 'responds to \'session2_end\' with response 1' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4
            session_two.assert_on_session2_checkingin4
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4a
            session.move_to_next_slide
            session_two.assert_on_session2_end
            answer_question_with(1)

            enter_quit_reason

            session.move_to_next_slide

            expect(page).to have_content 'It\'s Your Quit day!'
          end

          scenario 'responds to \'session2_end\' with response 3' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4
            session_two.assert_on_session2_checkingin4
            answer_question_with(1)
            session.move_to_next_slide
            session_two.assert_on_session2_checkingin4a
            session.move_to_next_slide
            session_two.assert_on_session2_end
            answer_question_with(3)
            session.move_to_next_slide

            expect(page).to have_content 'It\'s Your Quit day!'
          end

          feature 'responds to \'session2_end\' with response 2' do
            scenario 'responds to \'session2_benefits\' with response 1' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(1)
              session.move_to_next_slide

              expect(page).to have_content 'Healthy Changes Over Time'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 2' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(2)
              session.move_to_next_slide

              expect(page).to have_content 'Feel Better'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 3' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(3)
              session.move_to_next_slide

              expect(page).to have_content 'Look Better'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 4' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(4)
              session.move_to_next_slide

              expect(page).to have_content 'Smell Better'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 5' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(5)
              session.move_to_next_slide

              expect(page).to have_content 'Reduce Your Risk of Heart Disease'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 6' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(6)
              session.move_to_next_slide

              expect(page).to have_content 'Reduce Your Risk of Cancer'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 7' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(7)
              session.move_to_next_slide

              expect(page)
                .to have_content 'Protect Your Family - including your pets!'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 8' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(8)
              session.move_to_next_slide

              expect(page).to have_content 'Starting a Family'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 9' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(9)
              session.move_to_next_slide

              expect(page).to have_content 'Save Money'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 10' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(10)
              session.move_to_next_slide

              expect(page).to have_content 'Be Hassle-Free'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 11' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(11)
              session.move_to_next_slide

              expect(page).to have_content 'Be More in Control'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 12' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(12)
              session.move_to_next_slide

              expect(page).to have_content 'Be Guilt-free'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 13' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(13)
              session.move_to_next_slide

              expect(page).to have_content 'Protect the Environment'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end

            scenario 'responds to \'session2_benefits\' with response 14' do
              move_to_got_time
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              move_from_session2_traps_to_session2_checkingin4
              move_from_session2_checkingin4_to_session2_benefits
              session_two.assert_on_session2_benefits
              answer_question_with(14)
              session.move_to_next_slide

              expect(page).to have_content 'Say "no!" to Big Tobacco'

              session.move_to_next_slide

              expect(page).to have_content 'It\'s Your Quit day!'
            end
          end
        end

        feature 'responds to \'session2_social_support_1\' with response 2' do
          scenario 'responds to \'session2_social3b\' with response 1' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

          scenario 'responds to \'session2_social3b\' with response 2' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

        feature 'responds to \'session2_social_support_1\' with response 3' do
          scenario 'responds to \'session2_social3c\' with response 1' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

          scenario 'responds to \'session2_social3c\' with response 2' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

        feature 'responds to \'session2_social_support_1\' with response 4' do
          scenario 'responds to \'session2_social3d\' with response 1' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

          scenario 'responds to \'session2_social3d\' with response 2' do
            move_to_got_time
            move_from_got_time_to_session2_strategies2
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

  feature 'responds to \'session2_smokingstatus\' with response 3' do
    scenario 'responds to \'session2_reschedulingday\' with response 2' do
      session_two.assert_on_session2_smokingstatus
      answer_question_with(3)
      session.move_to_next_slide
      session_two.assert_on_session2_reschedulingday
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'What do you want to do now?'
    end

    feature 'responds to session2_reschedulingday with response 1' do
      scenario 'responds to \'not_quit\' with response 1' do
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

        expect(page).to have_content 'It\'s Your Quit day!'
      end

      scenario 'responds to \'not_quit\' with response 2' do
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

      scenario 'responds to \'not_quit\' with response 3' do
        session_two.assert_on_session2_smokingstatus
        answer_question_with(3)
        session.move_to_next_slide
        session_two.assert_on_session2_reschedulingday
        answer_question_with(1)

        cessation_date.pick_date

        session.move_to_next_slide
        session_two.assert_on_not_quit
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'It\'s Your Quit day!'
      end
    end
  end

  feature 'responds to \'session2_smokingstatus\' with response 5' do
    scenario 'responds to \'session2_notready2\' with response 1' do
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(1)
      session.move_to_next_slide

      expect(page).to have_content 'It\'s Your Quit day!'
    end

    scenario 'responds to \'session2_notready2\' with response 2' do
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

    scenario 'responds to \'session2_notready2\' with response 3' do
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

      expect(page).to have_content 'It\'s Your Quit day!'
    end

    scenario 'responds to \'session2_notready2\' with response 4' do
      session_two.assert_on_session2_smokingstatus
      answer_question_with(5)
      session.move_to_next_slide
      session_two.assert_on_session2_notready
      session.move_to_next_slide
      session_two.assert_on_session2_notready2
      answer_question_with(4)
      session.move_to_next_slide

      expect(page).to have_content 'It\'s Your Quit day!'
    end
  end
end
