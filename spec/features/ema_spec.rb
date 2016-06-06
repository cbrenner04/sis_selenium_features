# frozen_string_literal: true
# filename: ema_spec.rb

# require page objects
require './lib/pages/ema'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def ema
  @ema ||= EMA.new
end

def open_and_complete_slider_questions
  ema.open
  ema.set_first_value
  ema.set_second_value
  ema.set_third_value
  ema.set_fourth_value
  ema.set_fifth_value
  ema.set_sixth_value
  continue.select_continue
  ema.set_first_value
  ema.set_second_value
  ema.set_third_value
  ema.set_fourth_value
  continue.select_continue
  ema.set_first_value
  ema.set_second_value
  ema.set_third_value
  ema.set_fourth_value
  continue.select_continue
end

feature 'Participant opens app to complete EMA' do
  background do
    visit ENV['Base_URL']
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    navigation.reload
  end

  after { navigation.clear_data }

  scenario 'navigates to the EMA' do
    ema.open

    expect(page).to have_content 'MOOD: Please tell us how you felt'
  end

  scenario 'responds they are outside' do
    open_and_complete_slider_questions
    ema.select_ok
    ema.choose_outside
    ema.choose_outside_location

    expect(page).to have_content 'Are you currently:'
  end

  feature 'responds that they are inside' do
    scenario 'responds they are in a public place' do
      open_and_complete_slider_questions
      ema.select_ok
      ema.choose_inside
      ema.choose_public
      ema.choose_which_public_place

      expect(page).to have_content 'Are you currently:'
    end

    scenario 'responds they are in a non-public place alone' do
      open_and_complete_slider_questions
      ema.select_ok
      ema.choose_inside
      ema.choose_not_public
      ema.choose_alone

      expect(page).to have_content 'In the last 15 minutes, have you seen any'
    end

    feature 'responds they are in a non-public place with others' do
      scenario 'responds they have consumed a non-intoxicating beverage' do
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

      scenario 'responds they have consumed an intoxicating beverage' do
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
