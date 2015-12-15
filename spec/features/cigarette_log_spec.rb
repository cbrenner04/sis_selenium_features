# filename: cigarette_log_spec.rb

# require page objects
require 'cigarette_log'

describe 'Participant opens app', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'navigates to Cigarette Log' do
    find('.wide.btn.btn-default', text: 'CIGARETTE LOG').click
    expect(page).to have_content 'Cigarette Log'
    expect(page).to have_content "I'M SMOKING NOW..."
    expect(page).to have_content 'I FORGOT TO ENTER A CIGARETTE'
  end

  it "chooses a various reasons under 'I'm smoking now...'" do
    find('.wide.btn.btn-default', text: 'CIGARETTE LOG').click
    find('.btn.btn-lg', text: "I'M SMOKING NOW...").click
    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')
    radio = ['Reduce craving', 'Cope with negative emotion',
             'Enhance positive emotion', 'Habit/automatic',
             'Opportunity to socialize', 'Break from work/studying',
             'Boredom/to kill time', 'other'].sample
    choose radio
    find('.btn.btn-primary', text: 'CONTINUE').click
    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')
    find('.form-control').click
    find('.form-control').all('option')[rand(11)].select_option
    find('.btn.btn-primary', text: 'CONTINUE').click
    find('.btn.btn-primary', text: 'SAVE').click
    expect(page).to have_content '4 days until quit day'
  end

  it "chooses a various reasons under 'I forgot to enter a cigarette'" do
    find('.wide.btn.btn-default', text: 'CIGARETTE LOG').click
    find('.btn.btn-lg', text: 'I FORGOT TO ENTER A CIGARETTE').click
    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')
    radio = ['Reduce craving', 'Cope with negative emotion',
             'Enhance positive emotion', 'Habit/automatic',
             'Opportunity to socialize', 'Break from work/studying',
             'Boredom/to kill time', 'other'].sample
    choose radio
    find('.btn.btn-primary', text: 'CONTINUE').click
    expect(page).to_not have_css('.btn.btn-primary', text: 'CONTINUE')
    find('.form-control').click
    find('.form-control').all('option')[rand(11)].select_option
    find('.btn.btn-primary', text: 'CONTINUE').click
    find('.btn.btn-primary', text: 'SAVE').click
    expect(page).to have_content '4 days until quit day'
  end
end
