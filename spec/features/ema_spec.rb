# filename: ema_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'pages/ema'
require 'pages/continue'

def ema
  @ema ||= EMA.new
end

def open_and_complete_slider_questions
  ema.open
  ema.complete_mood_ratings
  continue.select_continue
  ema.complete_other_states_ratings
  continue.select_continue
  ema.complete_thinking_ratings
  continue.select_continue
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
    open_and_complete_slider_questions
    ema.select_ok
    ema.choose_outside
    ema.choose_outside_location

    expect(page).to have_content 'Are you currently:'
  end

  describe 'responds that they are inside' do
    it 'responds they are in a public place' do
      open_and_complete_slider_questions
      ema.select_ok
      ema.choose_inside
      ema.choose_public
      ema.choose_which_public_place

      expect(page).to have_content 'Are you currently:'
    end

    it 'responds they are in a non-public place alone' do
      open_and_complete_slider_questions
      ema.select_ok
      ema.choose_inside
      ema.choose_not_public
      ema.choose_alone

      expect(page).to have_content 'Are you currently in the company of a child'
    end

    describe 'responds they are in a non-public place with others' do
      it 'responds they have consumed a non-intoxicating beverage' do
        open_and_complete_slider_questions
        ema.select_ok
        ema.choose_inside
        ema.choose_not_public
        ema.choose_with_others
        ema.choose_company_response
        continue.select_continue
        ema.choose_with_children_response
        continue.select_continue
        ema.choose_gathering_response
        continue.select_continue
        ema.choose_company_response
        continue.select_continue
        ema.choose_non_intoxicating_substance
        continue.select_continue
        ema.finish

        expect(page).to have_content '4 days until quit day!'
      end

      it 'responds they have consumed an intoxicating beverage' do
        open_and_complete_slider_questions
        ema.select_ok
        ema.choose_inside
        ema.choose_not_public
        ema.choose_with_others
        ema.choose_company_response
        continue.select_continue
        ema.choose_with_children_response
        continue.select_continue
        ema.choose_gathering_response
        continue.select_continue
        ema.choose_company_response
        continue.select_continue
        ema.choose_intoxicating_substance
        continue.select_continue
        ema.choose_intoxicated_response
        continue.select_continue
        ema.finish

        expect(page).to have_content '4 days until quit day!'
      end
    end
  end
end
