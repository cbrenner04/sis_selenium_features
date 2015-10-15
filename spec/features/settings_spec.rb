# filename: settings_spec.rb

describe 'Participant opens app', type: :feature do
  context 'due to incomplete configuration' do
    before do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      page.execute_script("localStorage.removeItem('riskyTimes')")
      page.execute_script('window.location.reload()')
    end

    after do
      page.execute_script('localStorage.clear()')
    end

    it 'should be taken to settings menu' do
      date_1 = DateTime.now + 4
      expect(page).to have_css('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'is taken to settings menu, updates cessation date' do
      enter_cessation_date
      if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
        cessation_date = Date.today
      else
        cessation_date = Date.today + 32
      end
      expect(page).to have_css('#cessation_date_selector', text: "#{cessation_date.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'is taken to settings menu, adds reasons for stopping smoking' do
      enter_quit_reason('My reason')
      date_1 = DateTime.now + 4
      expect(page).to have_css('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'is taken to settings menu, adds risky times' do
      enter_risky_times
      date_1 = DateTime.now + 4
      expect(page).to have_css('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to have_css('#save_button')
    end

    it 'is taken to settings menu, adds social supports' do
      enter_social_supports('Johnny Quest')
      date_1 = DateTime.now + 4
      expect(page).to have_css('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'is taken to settings menu, completes configuration' do
      expect(page).to_not have_css('#save_button')
      enter_cessation_date
      if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
        cessation_date = Date.today
      else
        cessation_date = Date.today + 32
      end
      enter_quit_reason('My reason')
      enter_risky_times
      find('.btn.btn-info', text: 'YOUR SOCIAL SUPPORT').click
      find('.close').click
      find('#cessation_date_selector', text: "#{cessation_date.strftime('%m/%d/%Y')}")
      find('#save_button').click
    end
  end

  context 'after configuration is complete, visits configuration page' do
    before do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      find('#setup-menu').click
    end

    after do
      page.execute_script('localStorage.clear()')
    end

    it 'updates cessation date'

    it 'adds a reason for stopping smoking'

    it 'removes a reason for stopping smoking'

    it 'adds a risky time'

    it 'removes a risky time'

    it 'adds a social support'

    it 'removes a social support'
  end
end
