# frozen_string_literal: true
# filename: smoking_cessation_tools_spec.rb

# require helpers
require './spec/support/session_1_helper'
require './spec/support/smoking_cessation_tools_helper'

feature 'Participant navigates to Smoking Cessation tools' do
  background do
    visit ENV['Base_URL']
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload
    smoking_cessation_tool.open
  end

  after { navigation.clear_data }

  scenario 'and resets quit date' do
    smoking_cessation_tool.open_tool('SCHEDULE YOUR QUIT DAY')
    cessation_date.pick_date

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'and cancels reset quit date' do
    smoking_cessation_tool.open_tool('SCHEDULE YOUR QUIT DAY')
    cessation_date.click_cancel

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'completes Reasons for Quitting tool' do
    smoking_cessation_tool.open_tool('YOUR REASONS FOR QUITTING')
    enter_quit_reason

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'deletes an entry in Reasons for Quitting tool' do
    smoking_cessation_tool.open_tool('YOUR REASONS FOR QUITTING')
    remove_quit_reason

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'completes Manging Challenging Times tool' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    enter_risky_times
    sleep(1)

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'sees content specific instructions in Challenging Times modal' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    sleep(2)

    expect(smoking_cessation_tool).to have_risky_times_visible

    scroll_down

    risky_times_strategies.open
    risky_times_strategies.open_negative_emotions_strategy

    expect(risky_times_strategies).to have_negative_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_positive_emotions_strategy

    expect(risky_times_strategies).to have_positive_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_social_situations_strategy

    expect(risky_times_strategies).to have_social_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_drinking_alcohol_strategy

    expect(risky_times_strategies).to have_alcohol_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_habitual_smoking_strategy

    expect(risky_times_strategies).to have_habitual_smoking_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.open_hands_strategy

    expect(risky_times_strategies).to have_hands_strategy_present

    risky_times_strategies.close_strategy_help
    risky_times_strategies.exit
  end

  scenario 'adds a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')
    risky_times.create

    expect(risky_times).to have_two_risky_times_present
  end

  scenario 'removes a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')

    expect(risky_times).to have_risky_time_present('Test Risky Time')

    risky_times.remove

    expect(risky_times).to_not have_risky_time_present('Test Risky Time')
  end

  scenario 'edits a Challenging Time' do
    smoking_cessation_tool.open_tool('MANAGING YOUR CHALLENGING TIMES')

    expect(risky_times).to_not have_risky_time_present('do something kind')

    risky_times.open_edit_time
    sleep(2)
    risky_times.set_new_strategy
    sleep(2)
    risky_times.save_edited_time

    expect(risky_times).to have_risky_time_present('do something kind')
  end

  scenario 'completes Enlisting Your Social Supports tool' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')
    enter_social_supports
    # settings_page.assert_on_page

    expect(settings_page).to_not have_save_present
  end

  scenario 'adds a social support' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')
    social_supports.create
    settings_page.save

    expect(social_supports).to have_two_supports_present
  end

  scenario 'removes a social support' do
    smoking_cessation_tool.open_tool('ENLISTING YOUR SOCIAL SUPPORT')

    expect(social_supports).to have_test_social_support_present

    social_supports.remove

    expect(social_supports).to_not have_test_social_support_present
  end

  scenario 'cannot move past \'session1_benefits\' without responding' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits

    expect(continue).to be_disabled

    continue.select_continue
  end

  scenario 'responds to \'session1_benefits\' with response 1' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(1)
    session.move_to_next_slide

    expect(page).to have_content 'Healthy Changes Over Time'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 2' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'Feel Better'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 3' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(3)
    session.move_to_next_slide

    expect(page).to have_content 'Look Better'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 4' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(4)
    session.move_to_next_slide

    expect(page).to have_content 'Smell Better'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 5' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(5)
    session.move_to_next_slide

    expect(page).to have_content 'Reduce Your Risk of Heart Disease'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 6' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(6)
    session.move_to_next_slide

    expect(page).to have_content 'Reduce Your Risk of Cancer'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 7' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(7)
    session.move_to_next_slide

    expect(page).to have_content 'Protect Your Family - including your pets!'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 8' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(8)
    session.move_to_next_slide

    expect(page).to have_content 'Starting a Family'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 9' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(9)
    session.move_to_next_slide

    expect(page).to have_content 'Save Money'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 10' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(10)
    session.move_to_next_slide

    expect(page).to have_content 'Be Hassle-Free'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 11' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(11)
    session.move_to_next_slide

    expect(page).to have_content 'More in Control'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 12' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(12)
    session.move_to_next_slide

    expect(page).to have_content 'Be Guilt-free'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 13' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(13)
    session.move_to_next_slide

    expect(page).to have_content 'Protect the Environment'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 14' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(14)
    session.move_to_next_slide

    expect(page).to have_content 'Say "no!" to Big Tobacco'

    continue.select_continue
  end

  scenario 'responds to question \'session1_benefits\' with response 15' do
    smoking_cessation_tool.open_tool('BENEFITS OF QUITTING')
    session_one.assert_on_session1_benefits
    answer_question_with(15)
    session.move_to_next_slide

    expect(smoking_cessation_tool).to be_visible
  end

  scenario 'cannot move past \'session1_10\' without responding' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10

    expect(continue).to be_disabled
  end

  scenario 'responds to \'session1_10\' with response 1' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(1)
    session.move_to_next_slide

    expect(page).to have_content 'You\'re concerned that you\'ll feel ti' \
                                 'red without a cigarette.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 2' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(2)
    session.move_to_next_slide

    expect(page).to have_content 'You worry that your urges to smoke wil' \
                                 'l be so strong that you won\'t be able' \
                                 ' to stand it.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 3' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(3)
    session.move_to_next_slide

    expect(page).to have_content 'You mentioned that smoking cigarettes ' \
                                 'gives you a lift when you\'re feeling ' \
                                 'down.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 4' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(4)
    session.move_to_next_slide

    expect(page).to have_content 'It\'s hard to quit when others are smo' \
                                 'king around you.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 5' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(5)
    session.move_to_next_slide

    expect(page).to have_content 'You think you won\'t have the willpowe' \
                                 'r to quit smoking.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 6' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(6)
    session.move_to_next_slide

    expect(page).to have_content 'You worry that you\'ll be hungry, eat ' \
                                 'more, or gain weight.'

    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 7' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(7)
    session.move_to_next_slide

    expect(page).to have_content 'You\'ve selected "other".'

    session.set_notes
    continue.select_continue
  end

  scenario 'responds to \'session1_10\' with response 8' do
    smoking_cessation_tool.open_tool('CONCERNS ABOUT QUITTING')
    session_one.assert_on_session1_10
    answer_question_with(8)
    session.move_to_next_slide

    expect(page).to have_content 'You have no concerns at all about quit' \
                                 'ting smoking...'

    continue.select_continue
  end

  feature 'responds to \'session2_smokingstatus\' with response 1' do
    background do
      smoking_cessation_tool.open_tool('COMBATING SABOTAGING THOUGHTS')
    end

    scenario 'cannot move past \'got_time\' without responding' do
      session_two.assert_on_got_time

      expect(continue).to be_disabled
    end

    scenario 'responds to \'got_time\' with response 2' do
      session_two.assert_on_got_time
      answer_question_with(2)
      session.move_to_next_slide

      expect(page).to have_content 'No problem.'

      session.move_to_next_slide

      expect(smoking_cessation_tool).to be_visible
    end

    feature 'responds to \'got_time\' with response 1' do
      scenario 'cannot move past \'session2_strategies2\' without responding' do
        move_from_got_time_to_session2_strategies2

        expect(continue).to be_disabled
      end

      scenario 'responds to \'session2_strategies2\' with response 2' do
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
        move_from_got_time_to_session2_strategies2
        session_two.assert_on_session2_strategies2
        answer_question_with(3)
        session.move_to_next_slide

        expect(page).to have_content 'Update Your Strategies'
      end

      feature 'responds to \'session2_strategies2\' with response 1' do
        scenario "sees social supports listed in 'session2_social_support_1'" do
          move_from_got_time_to_session2_strategies2
          session_two.assert_on_session2_strategies2
          answer_question_with(1)
          session.move_to_next_slide
          session_two.assert_on_session2_stratok
          session.move_to_next_slide

          expect(page).to have_content 'Test Smith'
        end

        scenario 'cannot move past \'session2_social_support_1\' without ' \
           'responding' do
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
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps

            expect(continue).to be_disabled
          end

          feature 'responds to \'session2_traps\' with response 1' do
            scenario 'cannot move past \'session2_traps1a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(1)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps1a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps2a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(2)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps2a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps3a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(3)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps3a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps4a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(4)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps4a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps5a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(5)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps5a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps6a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps6a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps7a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(6)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps7a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps8a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(8)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps8a\' with response 1' do
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
            scenario 'cannot move past \'session2_traps9a\' with no response' do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(9)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps9a\' with response 1' do
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
            scenario "cannot move past 'session2_traps10a' with no response" do
              move_from_got_time_to_session2_strategies2
              move_from_session2_strategies2_to_session2_traps
              session_two.assert_on_session2_traps
              answer_question_with(10)
              session.move_to_next_slide

              expect(continue).to be_disabled
            end

            scenario 'responds to \'session2_traps10a\' with response 1' do
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

          scenario "cannot move past 'session2_checkingin4' with no response" do
            move_from_got_time_to_session2_strategies2
            move_from_session2_strategies2_to_session2_traps
            move_from_session2_traps_to_session2_checkingin4

            expect(smoking_cessation_tool).to be_visible
          end
        end

        feature 'responds to \'session2_social_support_1\' with response 2' do
          scenario 'responds to \'session2_social3b\' with response 1' do
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
end
