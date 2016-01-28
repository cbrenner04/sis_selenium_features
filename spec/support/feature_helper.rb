# filename: feature_helper.rb

def insert(key, value)
  page.execute_script("localStorage.setItem(\'#{key}\', \'#{value}\')")
end

def insert_all(date, session)
  insert(AuthToken::KEY, AuthToken::AUTH_1)
  insert(CessationDate::KEY, date)
  insert(CessationReasons::KEY, CessationReasons::REASON_1)
  insert(RiskyTimes::KEY, RiskyTimes::TIMES)
  insert(Sessions::KEY, session)
  insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
end

def answer_question_with(num)
  option = page.all('.session-option')
  opt = num - 1
  option[opt].click
end

def enter_quit_reason
  quit_reason.create
  modal.save
  modal.exit
end

def enter_social_supports
  social_supports.create
  modal.save
  modal.exit
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
  cessation_date.open
  cessation_date.pick_date
end

def enter_risky_times
  risky_times.create
  modal.save
  modal.exit
end

# instantiate common page objects
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
