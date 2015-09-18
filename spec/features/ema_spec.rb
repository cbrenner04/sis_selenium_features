# filename: ema_spec.rb

describe 'EMA', type: :feature do
  it 'completes the EMA' do
    time = Time.now
    current_hour = time.hour
    if current_hour.between?(9, 19)
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
    expect { click_on 'Continue' }.to raise_error

    loop do
      question_value = choose_answer(question_value)
      expect { click_on 'Continue' }.to raise_error
      break if page.has_css?('.btn.btn-primary', text: 'OK')
    end

    click_on 'OK'
    expect('h4').to have_content 'Your mood RIGHT BEFORE this report'

    loop do
      question_value = choose_answer(question_value)
      expect { click_on 'Continue' }.to raise_error
      break if page.has_css?('.btn.btn-primary', text: 'OK')
    end

    click_on 'OK'
    find('h2', greeting)
    expect { click_on 'Continue' }.to raise_error

    checkbox = page.all('.ng-pristine.ng-valid.ng-touched')
    checkbox[0].click
    expect('h4').to have_content 'In the last 15 minutes, have you seen any of these people smoke? (check all that apply)'

    expect { click_on 'Continue' }.to raise_error

    checkbox = page.all('.ng-pristine.ng-valid.ng-touched')
    checkbox[0].click
    expect('h4').to have_content 'Where are you at the moment?'

    click_on 'home'
    expect('h4').to have_content 'Check any of the following that you have consumed in the last hour'

    expect { click_on 'Continue' }.to raise_error

    choose_answer('Are you intoxicated right now?')

    click_on 'no'
    expect('h4').to have_content 'Thank you!'

    click_on 'Go Back'
    exp
  end
end
