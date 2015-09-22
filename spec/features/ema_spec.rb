# filename: ema_spec.rb

describe 'EMA', type: :feature do
  it 'completes the EMA' do
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
