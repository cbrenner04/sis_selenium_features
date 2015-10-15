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

    it 'redirects to settings menu' do
      date_1 = DateTime.now + 4
      find('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'redirects to settings menu, updates cessation date' do
      enter_cessation_date
      if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
        cessation_date = Date.today
      else
        cessation_date = Date.today + 32
      end
      expect(page).to have_css('#cessation_date_selector', text: "#{cessation_date.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'redirects to settings menu, adds reasons for stopping smoking' do
      enter_quit_reason('My reason')
      date_1 = DateTime.now + 4
      find('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'redirects to settings menu, adds risky times' do
      enter_risky_times
      date_1 = DateTime.now + 4
      find('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to have_css('#save_button')
    end

    it 'redirects to settings menu, adds social supports' do
      enter_social_supports('Johnny Quest')
      date_1 = DateTime.now + 4
      find('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      expect(page).to_not have_css('#save_button')
    end

    it 'redirects to settings menu, completes configuration' do
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

    it 'returns home' do
      date_1 = DateTime.now + 4
      find('#cessation_date_selector', text: "#{date_1.strftime('%m/%d/%Y')}")
      find('#save_button').click
      expect(page).to have_content '4 days until quit day'
    end

    it 'updates cessation date' do
      enter_cessation_date
      if Date.today.strftime('%B') == 'December' || Date.today.strftime('%d') > '26'
        cessation_date = Date.today
      else
        cessation_date = Date.today + 32
      end
      expect(page).to have_css('#cessation_date_selector', text: "#{cessation_date.strftime('%m/%d/%Y')}")
    end

    it 'adds a reason for stopping smoking' do
      find('.btn.btn-info', text: 'YOUR REASONS FOR STOPPING SMOKING').click
      fill_in 'reason', with: 'New reason'
      find('#save_button', text: 'SAVE').click
      within('.well.modal-well') do
        expect(page).to have_content 'New reason'
        expect(page).to have_css('.glyphicon.glyphicon-remove.glyphicon-sm', count: 2)
      end
    end

    it 'removes a reason for stopping smoking' do
      find('.btn.btn-info', text: 'YOUR REASONS FOR STOPPING SMOKING').click
      within('.well.modal-well') do
        expect(page).to have_content 'Test Reason 1'
        first('.glyphicon.glyphicon-remove.glyphicon-sm').click
        expect(page).to_not have_content 'Test Reason 1'
        expect(page).to_not have_css('.glyphicon.glyphicon-remove.glyphicon-sm')
        expect(page).to have_content 'Add cessation reasons below'
      end
    end

    it 'adds a risky time' do
      find('.btn.btn-info', text: 'YOUR RISKY TIMES').click
      find('.btn-group.ng-scope', text: 'W').click
      find('#risky_time_time').click
      sleep(1)
      time = Time.now.strftime('%I:%M')
      if time.between?('10:58', '12:00') || Time.now.strftime('%M') >= '58'
        find('.dwbw.dwb-s').click
        find('.well.modal-well', text: 'Add risky times below.')
        fill_in 'reason', with: 'New reason'
        find('#save_button', text: 'SAVE').click
        within('.well.modal-well') do
          expect(page).to have_content "#{Time.now.strftime('%l:%M %p')} - Wednesday\nNew reason"
          expect(page).to have_css('.glyphicon.glyphicon-remove.glyphicon-sm', count: 2)
        end
      else
        risky_time = Time.now + (62 * 60)
        element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
        element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
        find('.dw-i', text: "#{risky_time.strftime('%p')}").click
        fill_in 'reason', with: 'New reason'
        find('#save_button', text: 'SAVE').click
        within('.well.modal-well') do
          expect(page).to have_content "#{risky_time.strftime('%l:%M %p')} - Wednesday\nNew reason"
          expect(page).to have_css('.glyphicon.glyphicon-remove.glyphicon-sm', count: 2)
        end
      end
    end

    it 'removes a risky time' do
      find('.btn.btn-info', text: 'YOUR RISKY TIMES').click
      within('.well.modal-well') do
        expect(page).to have_content 'Test Risky Time'
        first('.glyphicon.glyphicon-remove.glyphicon-sm').click
        expect(page).to_not have_content 'Test Risky Time'
        expect(page).to_not have_css('.glyphicon.glyphicon-remove.glyphicon-sm')
        expect(page).to have_content 'Add risky times below'
      end
    end

    it 'adds a social support' do
      find('.btn.btn-info', text: 'YOUR SOCIAL SUPPORT').click
      fill_in 'name', with: 'Johnny Tsunami'
      find('#reason').click
      find("option[value = 'He/she will offer encouragement along the way.'").click
      find('#save_button', text: 'SAVE').click
      within('.well.modal-well') do
        expect(page).to have_content "Johnny Tsunami\nHe/she will offer encouragement along the way."
        expect(page).to have_css('.glyphicon.glyphicon-remove.glyphicon-sm', count: 2)
      end
    end

    it 'removes a social support' do
      find('.btn.btn-info', text: 'YOUR SOCIAL SUPPORT').click
      within('.well.modal-well') do
        expect(page).to have_content 'Test Smith'
        first('.glyphicon.glyphicon-remove.glyphicon-sm').click
        expect(page).to_not have_content 'Test Smith'
        expect(page).to_not have_css('.glyphicon.glyphicon-remove.glyphicon-sm')
        expect(page).to have_content 'Add additional social supports below'
      end
    end
  end
end
