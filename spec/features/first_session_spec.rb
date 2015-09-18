# filename: session1_spec.rb

describe 'Session 1', type: :feature do
  before do
    visit 'localhost:8000'
  end

  it 'upon first load, Session 1 is available' do
    expect(page).to have_content 'Click the button to begin...'
  end

  it 'cannot select continue when no cessation date is selected' do
    click_on 'Begin'
    expect(page).to have_css '#cessation_date_selector'
    expect { click_on 'Continue' }.to raise_error
  end

  it 'displays date picker when schedule your quit day is selected' do
    click_on 'Begin'
    find('#cessation_date_selector').click
    expect(page).to have_content 'SET'
  end

  it 'displays the cessation date when one is selected' do
    click_on 'Begin'
    set_cessation_date
    cessation_date = Date.today + 32
    expect(page).to have_content "Cessation date scheduled for: #{cessation_date.strftime('%m/%d/%Y')}"
  end

  it 'cannot select continue when no risky times provided' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    expect(page).to have_css('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke')
    expect { click_on 'Continue' }.to raise_error
  end

  it 'displays the risky times modal when it is selected' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    find('.btn.btn-info', text: 'Click here to add times in which you may have difficulty resisting the urge to smoke').click
    expect(page).to have_content 'Add risky times below.'
  end

  it 'displays the risky time in the modal when one is entered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
  end

  it 'cannot select continue when question 1 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 1' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Click here to add reason to quit'
  end

  it 'cannot select continue when a reason to quit has not be add' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Click here to add reason to quit'

    expect { click_on 'Continue' }.to raise_error
  end

  it 'displays reason to quit when one has been entered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    within('.well.modal-well') do
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end
  end

  it 'cannot select continue when a social support has not been entered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    expect { click_on 'Continue' }.to raise_error
  end

  it 'displays social support in modal when one has been entered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    within('.well.modal-well') do
      expect(page).to have_content "Jane Doe\nMy reason"
      expect(page).to have_css '.glyphicon.glyphicon-trash.glyphicon-sm'
    end
  end

  it 'cannot click continue when question 2 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Benefits of Quitting Smoking')
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 2' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Healthy Changes Over Time'
  end

  it 'cannot click continue when question 3 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 3' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You want to quit right now?'
  end

  it 'cannot click continue when question 4 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 4' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content "You're concerned that you'll feel tired without a cigarette."
  end

  it 'cannot click continue when question 5 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 5' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_quetion
    click_on 'Continue'
    expect(page).to have_content "You've decided to go ahead with a quit attempt"
  end

  it 'cannot click continue when question 6 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_quetion
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 6' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Dealing with Negative Emotions w/o Smoking'
  end

  it 'cannot click continue when question 7 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 7' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You indicated "other"'
  end

  it 'cannot click continue when question 8 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 8' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'
  end

  it 'cannot click continue when question 9 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 9' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'
  end

  it 'cannot click continue when question 10 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 10' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    click_on 'Continue'
    expect(page).to have_content "You've decided to do this quit attempt"
  end

  it 'cannot click continue when question 11 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error
  end

  it 'answers question 11' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question
    answer_question
    click_on 'Continue'
    expect(page).to have_content "That's ok"
  end

  it 'cannot click continue when question 12 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'It should!'
  end

  it 'answers question 12' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'It should!'
  end

  it 'cannot click continue when question 13 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'
  end

  it 'answers question 13' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'
  end

  it 'cannot click continue when question 14 has not been answered' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'
    expect { click_on 'Continue' }.to raise_error

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Receiving REminders To Stay on Track'
  end

  it 'answers question 14' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Receiving Reminders To Stay on Track'
  end

  it 'completes Session 1' do
    click_on 'Begin'
    set_cessation_date
    click_on 'Continue'
    set_risky_times
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    answer_question
    click_on 'Continue'
    set_quit_reason
    find('.close').click
    loop do
      click_on 'Continue'
      break unless page.has_no_css?('.btn.btn-info', text: 'Click here to add social supports')
    end

    set_social_supports
    find('.close').click
    click_on 'Continue'
    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'You feel that there is nobody in your life'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Excellent!'

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    go_to_next_question

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Difficult Times To Stay Smoke Free'

    answer_question
    click_on 'Continue'
    expect(page).to have_content 'Receiving Reminders To Stay on Track'

    visit 'localhost:8000'
    time = Time.now
    current_hour = time.hour
    if current_hour.between?(9, 19)
      expect(page).to have_content 'Good Morning!'
    end

    if current_hour.between?(19, 24) || current_hour.between?(0, 1)
      expect(page).to have_content 'Recalling The Day'
    end
  end
end
