# filename: ema_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'page_objects/ema'

def ema
  @ema ||= EMA.new
end

describe 'Participant opens app to complete EMA', type: :feature do
  before do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'navigates to the EMA' do
    ema.open

    expect(page).to have_content 'MOOD: Please tell us how you felt'
  end

  it 'responds they are outside' do
    ema.open
    ema.fill_in_mood_page
    ema.fill_in_other_states_page
    ema.fill_in_thinking_page
    ema.choose_outside
    ema.choose_outside_location

    expect(page).to have_content 'CONTEXT: Please tell us about your' \
                                 'current context.'
  end

  describe 'responds that they are inside' do
    it 'responds they are in a public place'
    it 'responds they are in a non-public place alone'

    describe 'responds they are in a non-public place with others' do
      it 'responds they have consumed a non-intoxicating beverage'
      it 'responds they have consumed an intoxicating beverage'
    end
  end
end
