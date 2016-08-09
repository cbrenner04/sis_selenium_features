# frozen_string_literal: true
# filename: ./spec/support/session_1_helper.rb

def move_to_session1_1
  session_one.enter_study_id('123')
  session.move_to_next_slide
  session_one.consent_to_use_data
  session.move_to_next_slide
  session_one.assert_on_session1_1
end

def move_from_session1_1_to_promoting_happiness
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session_one.assert_on_session1_3
  session.move_to_next_slide
  session_one.assert_on_session1_promoting_happiness
end

def move_from_session1_1_to_reason
  move_to_session1_1
  answer_question_with(1)
  move_from_session1_1_to_promoting_happiness
  session_one.select_three_good_things
  session.move_to_next_slide
  session_one.assert_on_three_good_things
  session.move_to_next_slide
  session_one.assert_on_session1_track_your_progress
  session.move_to_next_slide
  session_one.assert_on_session1_reasons
end

def move_to_quit_reason
  move_to_session1_1
  answer_question_with(3)
  session.move_to_next_slide
  session_one.enter_number_of_cigs_smoked('10')
  session.move_to_next_slide
  session_one.select_three_good_things
  session.move_to_next_slide
  session_one.assert_on_three_good_things
  session.move_to_next_slide
  session_one.assert_on_session1_track_your_progress
  session.move_to_next_slide
  session_one.assert_on_session1_4
  session.move_to_next_slide
  session_one.assert_on_session1_reasons
end

def move_from_reason_to_session1_19b
  session.move_to_next_slide
  session_one.assert_on_session1_benefits
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_benefits1
  session.move_to_next_slide
  session_one.assert_on_session1_5
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_7
  session.move_to_next_slide
  session_one.assert_on_session1_10
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_11
  session.move_to_next_slide
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

def move_from_session1_19b_to_social_support1
  session_one.assert_on_session1_19b
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_19c
  session.move_to_next_slide
  session_one.assert_on_session1_20
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_21
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

def move_from_reasons_to_supports_2
  move_from_reason_to_session1_19b
  move_from_session1_19b_to_social_support1
  session_one.assert_on_social_support1
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_session1_social6
  answer_question_with(1)
  session.move_to_next_slide
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

def move_from_quit_date_to_risky_times
  session.move_to_next_slide
  session_one.assert_on_quitday_scheduled
  answer_question_with(1)
  session.move_to_next_slide
  session_one.assert_on_quitday_scheduled2
  session.move_to_next_slide
  session_one.assert_on_difficult_1
end
