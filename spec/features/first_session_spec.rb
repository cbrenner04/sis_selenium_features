# filename: first_session_spec.rb

describe 'Participant configures app', type: :feature do
  before(:all) do
    visit 'localhost:8000'
    # insert(AuthToken::KEY, AuthToken::AUTH_1) # unnecessary with current functionality
  end

  before do
    visit 'localhost:8000'
  end

  it 'sees first session' do
    expect(page).to have_content 'START NOW'
  end

  it 'completes Session 1' do
    find('.btn.btn-primary', text: 'START NOW').click
    find('h3', text: 'Welcome to the "Smile Instead of Smoke" (SiS) App!')
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')

    answer_question(0)
    4.times do
      click_on 'Continue'
    end

    find('h3', text: 'Your Reasons for Quitting Smoking')
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')

    find('.btn.btn-info').click
    expect(page).to have_css('#save_button[disabled = disabled]')
    fill_in 'reason', with: 'My reason'
    find('#save_button').click
    within('.well.modal-well') do
      expect(page).to have_content 'My reason'
      expect(page).to have_css '.glyphicon.glyphicon-remove.glyphicon-sm'
    end

    find('#exit_button').click
    click_on 'Continue'
    answer_question(0)
    8.times do
      go_to_next_question
      answer_question(0)
    end

    3.times { click_on 'Continue' }
    find('h3', text: 'Enlisting Your Social Support')
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')

    find('.btn.btn-info').click
    expect(page).to have_css('#save_button[disabled = disabled]')
    fill_in 'name', with: 'Jane Doe'
    find('#reason').click
    find("option[value = 'He/she will offer encouragement along the way.'").click
    find('#save_button').click
    within('.well.modal-well') do
      expect(page).to have_content "Jane Doe\nHe/she will offer encouragement along the way."
      expect(page).to have_css '.glyphicon.glyphicon-remove.glyphicon-sm'
    end

    find('.close').click
    click_on 'Continue'

    2.times do
      find('.btn.btn-info').click
      find('.glyphicon.glyphicon-remove.glyphicon-sm')
      find('.close').click
      click_on 'Continue'
    end

    answer_question(0)
    2.times { click_on 'Continue' }
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
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

    click_on 'Continue'
    answer_question(0)
    go_to_next_question
    expect(page).to have_css('button[disabled = disabled]', text: 'CONTINUE')
    find('.btn.btn-info', text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
    find('.btn-group.ng-scope', text: 'Tu').click
    find('#risky_time_time').click
    time = Time.now.strftime('%I:%M')
    if time.between?('10:58', '12:00') || Time.now.strftime('%M') >= '58'
      find('.dwbw.dwb-s').click
      find('.well.modal-well', text: 'Add risky times below.')
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      within('.well.modal-well') do
        expect(page).to have_content "#{Time.now.strftime('%l:%M %p')} - Tuesday\nMy reason"
        expect(page).to have_css '.glyphicon.glyphicon-remove.glyphicon-sm'
      end
    else
      risky_time = Time.now + (62 * 60)
      element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
      element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
      find('.dw-i', text: "#{risky_time.strftime('%p')}").click
      fill_in 'reason', with: 'My reason'
      find('#save_button').click
      within('.well.modal-well') do
        expect(page).to have_content "#{risky_time.strftime('%l:%M %p')} - Tuesday\nMy reason"
        expect(page).to have_css '.glyphicon.glyphicon-remove.glyphicon-sm'
      end
    end

    find('.close').click
    click_on 'Continue'
    find('.btn.btn-info', text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
    find('h3', text: 'Add a day and time:')
    find('.close').click
    click_on 'Continue'
    find('h3', text: 'Receiving Reminders To Stay on Track')
    click_on 'Continue'
    find('.question.well')
    click_on 'Continue'
    find('h3', text: 'Congrats again: You are now all set for your quit day!')
    click_on 'Continue'
    if Date.today.strftime('%B') == 'December' || Date.today.strftime('%-d') > '26'
      cess_date = "#{Date.today.strftime('%b. %-d')}"
    else
      new_date = Date.today + 32
      cess_date = "#{new_date.strftime('%b. %-d')}"
    end
    find('.question.well', text: cess_date)
    click_on 'Continue'
    find('.btn.btn-primary', text: 'GO HOME').click
    expect(page).to have_css('#smokingStatus')
  end
end
