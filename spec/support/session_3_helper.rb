# filename: ./spec/support/session_3_helper.rb

# require page objects, these are instantiated in the feature_helper
require 'pages/session_three'
require 'pages/session'
require 'pages/continue'
require 'pages/settings_page'
require 'pages/modal'
require 'pages/risky'
require 'pages/cessation'

def move_to_session3_gottime
  session_three.assert_on_session3_smokingstatus
  answer_question_with(1)
  session.move_to_next_slide
  session_three.assert_on_session3_1
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_benefits
  session_three.assert_on_session3_gottime
  answer_question_with(1)
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_strategies2
  move_from_session3_gottime_to_session3_benefits
  session_three.assert_on_session3_benefits
  answer_question_with(1)
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_strategiesupdate
  move_from_session3_gottime_to_session3_strategies2
  session_three.assert_on_session3_strategies2
  answer_question_with(2)
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_strategies2a
  move_from_session3_gottime_to_session3_strategiesupdate
  session_three.assert_on_session3_strategiesupdate
  answer_question_with(2)
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_social_support1
  move_from_session3_gottime_to_session3_strategies2a
  session_three.assert_on_session3_strategies2a
  answer_question_with(1)
  session.move_to_next_slide
  session_three.assert_on_session3_strategies2b
  session.move_to_next_slide
  session_three.assert_on_session3_3h
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_social3
  move_from_session3_gottime_to_session3_social_support1
  session_three.assert_on_session3_social_support1
  answer_question_with(1)
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_thinkingtraps
  move_from_session3_gottime_to_session3_social3
  session_three.assert_on_session3_social3
  answer_question_with(1)
  session.move_to_next_slide
  session_three.assert_on_session3_social3a
  session.move_to_next_slide
  session_three.assert_on_session3_thinking
  session.move_to_next_slide
end

def move_from_session3_gottime_to_session3_checkingin4
  move_from_session3_gottime_to_session3_thinkingtraps
  session_three.assert_on_session3_thinkingtraps
  answer_question_with(1)
  session.move_to_next_slide
  session_three.assert_on_session3_think1a
  answer_question_with(1)
  session.move_to_next_slide
  session_three.assert_on_session3_think1b
  session.move_to_next_slide
end
