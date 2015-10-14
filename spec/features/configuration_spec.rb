require_relative '../support/local_storage/authentication_token.rb'
require_relative '../support/local_storage/cessation_date.rb'
require_relative '../support/local_storage/cessation_reasons.rb'
require_relative '../support/local_storage/risky_times.rb'
require_relative '../support/local_storage/sessions.rb'
require_relative '../support/local_storage/social_supports.rb'

describe 'On initial app load', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'sees configuration token form' do
    expect(page).to have_content 'Please enter the configuration code'
  end

  it 'configures phone for offline use' do
    find('input[type = text]').set('offline')
    expect(page).to have_content 'START NOW'
  end

  it 'acts like phone has been configured, sees first session' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content 'START NOW'
  end

  it 'shows cessation date in the future' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_1)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '4 days until quit day'
  end

  it 'shows cessation date is today' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_2)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content "It's Your Quit day"
  end

  it 'shows cessation date is in the past' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_3)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '7 days since you quit'
  end

  it 'shows only first session is available' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_1)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 2') do
      expect(page).to_not have_css('.label.label-lg.label-success')
    end
  end

  it 'shows second session is available' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_2)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 3') do
      expect(page).to_not have_css('.label.label-lg.label-success')
    end
  end

  it 'shows third session is available' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_3)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
  end

  it 'shows first session is complete' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_1)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_1)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 2') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows second session is complete' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_2)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_2)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 3') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows third session is complete' do
    insert(AuthToken::KEY, AuthToken::AUTH_1)
    insert(CessationDate::KEY, CessationDate::DATE_3)
    insert(CessationReasons::KEY, CessationReasons::REASON_1)
    insert(RiskyTimes::KEY, RiskyTimes::TIME_1)
    insert(Sessions::KEY, Sessions::SESSION_3)
    insert(SocialSupports::KEY, SocialSupports::SUPPORT_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end
end

def insert(key, value)
  page.execute_script("localStorage.setItem(\'#{key}\', \'#{value}\')")
end
