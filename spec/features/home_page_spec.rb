# filename: home_page_spec.rb

describe 'Participant opens app', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'shows cessation date in the future' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '4 days until quit day'
  end

  it 'shows cessation date is today' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content "It's Your Quit day"
  end

  it 'shows cessation date is in the past' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '7 days since you quit'
  end

  it 'shows only first session is available' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 2') do
      expect(page).to_not have_css('.label.label-lg.label-success')
    end
  end

  it 'shows second session is available' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 3') do
      expect(page).to_not have_css('.label.label-lg.label-success')
    end
  end

  it 'shows third session is available' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
  end

  it 'shows first session is complete' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 2') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows second session is complete' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_2)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 3') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows third session is complete' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_3)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end
end

def insert_all(date, session)
  insert(AuthToken::KEY, AuthToken::AUTH_1)
  insert(CessationDate::KEY, date)
  insert(CessationReasons::KEY, CessationReasons::REASON_1)
  insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
  insert(Sessions::KEY, session)
  insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
end