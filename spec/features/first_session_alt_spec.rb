# filename: session1_alt_spec.rb

describe 'Session 1', type: :feature do
  it 'completes Session 1' do
    visit 'localhost:8000'
    expect(page).to have_content 'Click the button to begin...'
    click_on 'Begin'
    expect(page).to have_css '#cessation_date_selector'
    expect { click_on 'Continue' }.to raise_error

    find('#cessation_date_selector').click
    expect(page).to have_content 'SET'

    cessation_date = Date.today + 32
    find('.dw-mon', text: "#{cessation_date.strftime('%B')}").click
    find('.dw-i', text: "#{cessation_date.strftime('%d')}").click
    find('.dw-i', text: "#{cessation_date.strftime('%Y')}").click
    expect(page).to have_content "Cessation date scheduled for: #{cessation_date.strftime('%m/%d/%Y')}"

    click_on 'Continue'
    expect(page).to have_css('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke')
    expect { click_on 'Continue' }.to raise_error

    find('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke').click
    expect(page).to have_content 'Add risky times below.'

    find('.btn-group.ng-scope', text: 'Tu').click
    find('.btn.btn-default.weekday_button.modal-well.ng-binding.active')
    find('#risky_time_time').click
    risky_time = Time.now + (62 * 60)
    hour = page.all('.dw-i', text: "#{risky_time.strftime('%I')}")
    hour[0].click
    minute = page.all('.dw-i', text: "#{risky_time.strftime('%M')}")
    if minute.count > 1
      minute[1].click
    else
      minute[0].click
    end
    find('.dw-i', text: "#{risky_time.strftime('%p')}").click
    fill_in 'reason', with: 'My reason'
    find('a', text: 'Save').click
    within('.well.modal-well') do
      expect(page).to have_content "#{risky_time.strftime('%l:%M %p')} - Tuesday"
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end

    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Click here to add reason to quit'

    expect { click_on 'Continue' }.to raise_error

    find('.btn.btn-info', text: 'Click here to add reason to quit').click
    fill_in 'reason', with: 'My reason'
    find('a', text: 'Save').click
    within('.well.modal-well') do
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end

    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    expect { click_on 'Continue' }.to raise_error

    find('.btn.btn-info', text: 'Click here to add social supports').click
    fill_in 'name', with: 'Jane Doe'
    fill_in 'reason', with: 'My reason'
    find('a', text: 'Save').click
    within('.well.modal-well') do
      expect(page).to have_content 'Jane Doe'
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end

    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Benefits of Quitting Smoking')
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Healthy Changes Over Time'

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You want to quit right now?'

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content "You're concerned that you'll feel tired without a cigarette."

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content "You've decided to go ahead with a quit attempt"

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Dealing with Negative Emotions w/o Smoking'

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You indicated "other"'

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content "You've decided to do this quit attempt"

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content "That's ok"

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'It should!'

    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'

    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Receiving Reminders To Stay on Track'

    visit 'localhost:8000'
    time = Time.now
    current_hour = time.strftime('%H')
    if current_hour > '12'
      expect(page).to have_content 'Recalling the Day'
    else
      expect(page).to have_content 'Good Morning'
    end
  end
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
