# filename: session1_alt_spec.rb

describe 'Session 1', type: :feature do
  it 'completes Session 1' do
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
      expect(page).to have_content 'Good Morning!'
    end

    if current_hour.between?(19, 24) || current_hour.between?(0, 1)
      expect(page).to have_content 'Recalling The Day'
    end
  end
end
