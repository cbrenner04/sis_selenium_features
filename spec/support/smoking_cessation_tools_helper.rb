# frozen_string_literal: true
# filename: ./spec/support/smoking_cessation_tools_helper.rb

require './lib/pages/smoking_cessation_tool'

def smoking_cessation_tool
  @smoking_cessation_tool ||= SmokingCessationTool.new
end

def move_from_got_time_to_session2_strategies2
  session_two.assert_on_got_time
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_overview
  session.move_to_next_slide
end

def move_from_session2_strategies2_to_session2_traps
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
end

def move_from_session2_traps_to_session2_checkingin4
  session_two.assert_on_session2_traps
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_traps1a
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_traps1b
  session.move_to_next_slide
end
