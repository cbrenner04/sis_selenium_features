# frozen_string_literal: true
# filename: feature_helper.rb

# require local storage data
require './lib/local_storage/auth_token'
require './lib/local_storage/cessation_date'
require './lib/local_storage/cessation_reasons'
require './lib/local_storage/risky_times'
require './lib/local_storage/sessions'
require './lib/local_storage/social_supports'

# require page objects
require './lib/pages/cessation'
require './lib/pages/continue'
require './lib/pages/happiness_exercise'
require './lib/pages/modal'
require './lib/pages/navigation'
require './lib/pages/quit_reason'
require './lib/pages/risky'
require './lib/pages/risky_times_strategies'
require './lib/pages/session'
require './lib/pages/session_one'
require './lib/pages/session_two'
require './lib/pages/session_three'
require './lib/pages/settings_page'
require './lib/pages/social'

def insert(key, value)
  execute_script("localStorage.setItem(\'#{key}\', \'#{value}\')")
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
  all('.session-option')[num - 1].click
end

def enter_quit_reason
  quit_reason.create
  scroll_down
  modal.save
  modal.exit
end

def remove_quit_reason
  quit_reason.remove
  scroll_down
  modal.save
  modal.exit
end

def enter_social_supports
  social_supports.create
  scroll_down
  modal.save
  modal.exit
end

def element_count(num, elem, text)
  element = all(elem, text: text)
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
  scroll_down
  modal.save
  modal.exit
end

def scroll_down
  execute_script('window.scrollBy(0,1500)')
end

# instantiate common page objects
def cessation_date
  @cessation_date ||= Cessation.new
end

def continue
  @continue ||= Continue.new
end

def happiness_exercises
  @happiness_exercises ||= HappinessExercise.new
end

def modal
  @modal ||= Modal.new
end

def navigation
  @navigation ||= Navigation.new
end

def quit_reason
  @quit_reason ||= QuitReason.new('My reason')
end

def risky_times
  @risky_times ||= Risky.new
end

def risky_times_strategies
  @risky_times_strategies ||= RiskyTimesStrategy.new
end

def session
  @session ||= Session.new
end

def session_one
  @session_one ||= SessionOne.new
end

def session_two
  @session_two ||= SessionTwo.new
end

def session_three
  @session_three ||= SessionThree.new
end

def settings_page
  @settings_page ||= SettingsPage.new
end

def social_supports
  @social_supports ||= SocialSupport.new('Jane Doe')
end
