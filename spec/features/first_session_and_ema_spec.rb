# filename: fist_session_and_ema_spec.rb

describe 'All', type: :feature do
  it 'Completes first session and EMA' do
    visit 'localhost:8000'
    expect(page).to have_content 'Click the button to begin...'
    click_on 'Begin'
    expect(page).to have_css '#cessation_date_selector'
    expect { click_on 'Continue' }.to raise_error

    set_cessation_date

    click_on 'Continue'
    expect(page).to have_css('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke')
    expect { click_on 'Continue' }.to raise_error

    set_risky_times

    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Click here to add reason to quit'

    expect { click_on 'Continue' }.to raise_error

    set_quit_reason
    within('.well.modal-well') do
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end

    find('.close').click
    loop do
      click_on 'Continue'
      break if page.has_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    expect { click_on 'Continue' }.to raise_error

    set_social_supports
    within('.well.modal-well') do
      expect(page).to have_content "Jane Doe\nMy reason"
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end

    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Benefits of Quitting Smoking')
    expect { click_on 'Continue' }.to raise_error

    text_array = ['Healthy Changes Over Time', 'You want to quit right now?',
                  "You're concerned that you'll feel tired without a cigarette.",
                  "You've decided to go ahead with a quit attempt",
                  'Dealing with Negative Emotions w/o Smoking', 'You indicated "other"']
    text_array.each do |slide_text|
      answer_question
      click_on 'Continue'
      expect(page).to have_content slide_text

      go_to_next_question
      expect { click_on 'Continue' }.to raise_error
    end

    text_array = ['You feel that there is nobody in your life', 'Excellent!']
    text_array.each do |slide_text|
      answer_question
      click_on 'Continue'
      expect(page).to have_content slide_text
      expect { click_on 'Continue' }.to raise_error
    end

    text_array = ["You've decided to do this quit attempt", "That's ok", 'It should!']
    text_array.each do |slide_text|
      answer_question
      click_on 'Continue'
      expect(page).to have_content slide_text

      go_to_next_question
      expect { click_on 'Continue' }.to raise_error
    end

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Receiving Reminders To Stay on Track'

    visit 'localhost:8000'
    time = Time.now
    current_hour = time.hour
    if current_hour.between?(9, 18)
      greeting = 'Good Morning!'
    elsif current_hour.between?(19, 24) || current_hour.between?(0, 1)
      greeting = 'Recalling The Day'
    end

    find('h2', text: greeting)
    if current_hour.between?(19, 24) || current_hour.between?(0, 1)
      3.times do
        expect { click_on 'Continue' }.to raise_error
        question_value = find('h4').text
        find(:css, '.form-control.ng-pristine.ng-untouched.ng-valid').set('15')
        expect(page).to have_content question_value
        click_on 'Continue'
        expect(page).to_not have_content question_value
      end
    end

    question_value = find('h4').text
    loop do
      question_value = choose_answer(question_value)
      expect { click_on 'Continue' }.to raise_error
      break if page.has_css?('.btn.btn-primary', text: 'OK')
    end

    click_on 'OK'
    expect(page).to have_content 'Your mood RIGHT BEFORE this report'

    question_value = find('h4').text
    loop do
      question_value = choose_answer(question_value)
      expect { click_on 'Continue' }.to raise_error
      break if page.has_css?('.btn.btn-primary', text: 'OK')
    end

    click_on 'OK'

    2.times do
      question_value = find('h4').text
      expect { click_on 'Continue' }.to raise_error
      checkbox = page.all('.ng-pristine.ng-untouched.ng-valid')
      checkbox[0].click
      click_on 'Continue'
      expect(page).to_not have_content question_value
    end

    click_on 'home'
    expect(page).to have_content 'Check any of the following that you have consumed in the last hour'

    expect { click_on 'Continue' }.to raise_error

    choose_answer('Check any of the following that you have consumed in the last hour')

    expect(page).to have_content 'Are you intoxicated right now?'

    expect { click_on 'Continue' }.to raise_error

    click_on 'no'
    expect(page).to have_content 'Thank you!'

    find('.btn.btn-primary', text: 'Go Back').click
    expect(page).to have_css('h1', text: 'SiS')
  end
end
