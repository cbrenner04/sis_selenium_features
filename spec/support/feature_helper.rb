# filename: feature_helper.rb

def insert(key, value)
  page.execute_script("localStorage.setItem(\'#{key}\', \'#{value}\')")
end

def insert_all(date, session)
  insert(AuthToken::KEY, AuthToken::AUTH_1)
  insert(CessationDate::KEY, date)
  insert(CessationReasons::KEY, CessationReasons::REASON_1)
  insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
  insert(Sessions::KEY, session)
  insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
end

def answer_question_with(num)
  option = page.all('.col-sm-1.col-xs-1.col-md-1.text-left')
  opt = num - 1
  option[opt].click
  continue.move_to_next_slide
end

def enter_quit_reason
  quit_reason.assert_on_correct_page
  modal.open
  quit_reason.create
  modal.save
  modal.exit
  continue.move_to_next_slide
end

def enter_social_supports
  social_supports.assert_on_correct_page
  modal.open
  social_supports.create
  modal.save
  modal.exit
  continue.move_to_next_slide
end

def element_count(num, elem, text)
  element = page.all(elem, text: text)
  if element.count > 1
    element[num].click
  else
    find(elem, text: text).click
  end
end

def enter_cessation_date
  cessation_date.assert_on_correct_page
  cessation_date.open
  cessation_date.pick_date
  cessation_date.assert_on_correct_page
  continue.move_to_next_slide
end

def enter_risky_times
  risky_times.assert_on_correct_page
  risky_times.open
  risky_times.create
  modal.save
  modal.exit
  continue.move_to_next_slide
end

def session
  @session ||= Session.new
end

def session_one
  @session_one ||= SessionOne.new
end

def continue
  @continue ||= Continue.new
end

def quit_reason
  @quit_reason ||= QuitReason.new('My reason')
end

def modal
  @modal ||= Modal.new
end

def social_supports
  @social_supports ||= SocialSupport.new('Jane Doe')
end

def cessation_date
  @cessation_date ||= Cessation.new
end

def risky_times
  @risky_times ||= Risky.new
end

def settings_page
  @settings_page ||= SettingsPage.new
end

def session_two
  @session_two ||= SessionTwo.new
end

def session_three
  @session_three ||= SessionThree.new
end

def happiness_exercises
  @happiness_exercises ||= HappinessExercise.new
end

# def go_to_next_question
#   loop do
#     click_on 'Continue'
#     break unless page.has_no_css?('.col-sm-1.col-xs-1.col-md-1.text-left')
#   end
# end
