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

def answer_question(opt)
  option = page.all('.col-sm-1.col-xs-1.col-md-1.text-left')
  option[opt].click
  click_on 'Continue'
end

def enter_quit_reason(reason)
  find('h3', text: 'Your Reasons for Quitting Smoking')
  find('.btn.btn-info').click
  fill_in 'reason', with: reason
  find('#save_button').click
  find('#exit_button').click
  click_on 'Continue'
end

def enter_social_supports(name)
  find('h3', text: 'Enlisting Your Social Support')
  find('.btn.btn-info').click
  fill_in 'name', with: name
  find('#reason').click
  find("option[value = 'He/she will offer encouragement along the way.'").click
  find('#save_button').click
  find('#exit_button').click
  find('h3', text: 'Enlisting Your Social Support')
  click_on 'Continue'
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
  find('h3', text: 'Splendid!')
  find('#cessation_date_selector').click
  if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
    find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
  else
    cessation_date = Date.today + 32
    find('.dw-mon', text: "#{cessation_date.strftime('%B')}").click
    element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
    find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
  end
  find('h3', text: 'Splendid!')
  click_on 'Continue'
end

def enter_risky_times
  find('h3', text: 'Difficult Times To Stay Smoke Free')
  find('.btn.btn-info',
       text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
  find('.btn-group.ng-scope', text: 'Tu').click
  find('#risky_time_time').click
  sleep(1)
  time = Time.now.strftime('%I:%M')
  if time.between?('10:58', '12:00') || Time.now.strftime('%M') >= '58'
    find('.dwbw.dwb-s').click
    find('.well.modal-well', text: 'Add risky times below.')
    fill_in 'reason', with: 'My reason'
    find('#save_button').click
  else
    risky_time = Time.now + (62 * 60)
    element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
    element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
    find('.dw-i', text: "#{risky_time.strftime('%p')}").click
    fill_in 'reason', with: 'My reason'
    find('#save_button').click
  end
  find('#exit_button').click
  click_on 'Continue'
end

# def go_to_next_question
#   loop do
#     click_on 'Continue'
#     break unless page.has_no_css?('.col-sm-1.col-xs-1.col-md-1.text-left')
#   end
# end
