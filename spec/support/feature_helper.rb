# filename: feature_helper.rb

def set_cessation_date
  find('#cessation_date_selector').click
  if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
    find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
    expect(page).to have_content "Cessation date scheduled for: #{Date.today.strftime('%m/%d/%Y')}"
  else
    cessation_date = Date.today + 32
    find('.dw-mon', text: "#{cessation_date.strftime('%B')}").click
    element_count(0, '.dw-i', "#{cessation_date.strftime('%d')}")
    find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
    expect(page).to have_content "Cessation date scheduled for: #{cessation_date.strftime('%m/%d/%Y')}"
  end
end

def set_risky_times
  find('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke').click
  find('.btn-group.ng-scope', text: 'Tu').click
  find('#risky_time_time').click
  time = Time.now.strftime('%I:%M')
  if time.between?('10:58', '12:00')
    find('.dwbw.dwb-s').click
    find('.well.modal-well', text: 'Add risky times below.')
    fill_in 'reason', with: 'My reason'
    find('a', text: 'Save').click
    within('.well.modal-well') do
      expect(page).to have_content "#{Time.now.strftime('%l:%M %p')} - Tuesday\nMy reason"
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end
  else
    risky_time = Time.now + (62 * 60)
    element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
    element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
    find('.dw-i', text: "#{risky_time.strftime('%p')}").click
    fill_in 'reason', with: 'My reason'
    find('a', text: 'Save').click
    within('.well.modal-well') do
      expect(page).to have_content "#{risky_time.strftime('%l:%M %p')} - Tuesday\nMy reason"
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end
  end
end

def element_count(num, elem, text)
  element = page.all(elem, text: text)
  if element.count > 1
    element[num].click
  else
    find(elem, text: text).click
  end
end

def set_quit_reason
  find('.btn.btn-info', text: 'Click here to add reason to quit').click
  fill_in 'reason', with: 'My reason'
  find('a', text: 'Save').click
end

def set_social_supports
  find('.btn.btn-info', text: 'Click here to add social supports').click
  fill_in 'name', with: 'Jane Doe'
  fill_in 'reason', with: 'My reason'
  find('a', text: 'Save').click
end

def answer_question
  option = page.all('.col-sm-1.col-xs-1.col-md-1.text-left')
  option[0].click
end

def go_to_next_question
  loop do
    click_on 'Continue'
    break unless page.has_no_css?('.col-sm-1.col-xs-1.col-md-1.text-left')
  end
end

def choose_answer(question)
  find('.form-control.ng-pristine.ng-untouched.ng-valid').click
  option = page.all('.ng-binding.ng-scope')
  option[0].click
  expect(page).to have_content question
  click_on 'Continue'
  expect('h4').to_not have_content question
  find('h4').text
end
