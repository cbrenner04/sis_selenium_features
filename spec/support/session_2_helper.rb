# frozen_string_literal: true
# filename: ./spec/support/session_2_helper.rb

def move_to_got_time
  # session_two.assert_on_session2_smokingstatus
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_1
  session.move_to_next_slide
end

def move_from_got_time_to_session2_strategies2
  # session_two.assert_on_got_time
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_overview
  session.move_to_next_slide
end

def move_from_session2_strategies2_to_session2_traps
  # session_two.assert_on_session2_strategies2
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
  # session_two.assert_on_session2_traps
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_traps1a
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_traps1b
  session.move_to_next_slide
end

def move_from_session2_checkingin4_to_session2_benefits
  # session_two.assert_on_session2_checkingin4
  answer_question_with(1)
  session.move_to_next_slide
  session_two.assert_on_session2_checkingin4a
  session.move_to_next_slide
  session_two.assert_on_session2_end
  answer_question_with(2)
  session.move_to_next_slide
end
