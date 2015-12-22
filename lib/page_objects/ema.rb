require 'support/capybara'

# page object for EMA
class EMA
  include Capybara::DSL

  def open
    find('.btn', text: 'CLICK HERE TO TAKE A MINI SURVEY').click
  end

  def complete_mood_ratings
    set_first_value
    set_second_value
    set_third_value
    set_fourth_value
    set_fifth_value
    set_sixth_value
  end

  def complete_other_states_ratings
    set_first_value
    set_second_value
    set_third_value
    set_fourth_value
  end

  def complete_thinking_ratings
    set_first_value
    set_second_value
    set_third_value
    set_fourth_value
  end

  def finish
    find('.btn', text: 'GO BACK').click
  end

  def select_ok
    find('button', text: 'OK').click
  end

  def choose_inside
    find('button', text: 'INSIDE').click
  end

  def choose_outside
    find('button', text: 'OUTSIDE').click
  end

  def choose_in_transit
    find('button', text: 'IN TRANSIT').click
  end

  def choose_not_public
    location = ['IN YOUR APT / HOUSE /ROOM', 'ANOTHER PRIVATE RESIDENCE',
                'AT WORK', 'AT SCHOOL'].sample
    find('button', text: location).click
  end

  def choose_public
    find('button',
         text: 'IN A PUBLIC BUILDING (E.G., RETAIL STORE, RESTAURANT, BAR)')
      .click
  end

  def choose_which_public_place
    location = ['IN A RESTAURANT / BAR', 'RETAIL STORE, MALL',
                'MOVIE THEATER, SPORTS STADIUM',
                'PUBLIC OFFICE (E.G., TOWN HALL, LIBRARY)',
                'TRANSIT STATION (E.G., TRAIN STATION, AIRPORT)',
                'HOSPITAL'].sample
    find('button', text: location).click
  end

  def choose_outside_location
    location = ['IN A PUBLIC PARK / GREEN SPACE / BEACH',
                'SPORTING VENUE (E.G., SOCCER FIELD)',
                'YOUR BACKYARD / DECK / PRIVATE OUTSIDE AREA',
                'JUST OUTSIDE A BUILDING / WALKING DOWN THE STREET',
                'AT A BUS STOP OR TRAIN STATION'].sample
    find('button', text: location).click
  end

  def choose_alone
    find('button', text: 'ALONE').click
  end

  def choose_with_others
    find('button', text: 'WITH OTHERS').click
  end

  def choose_company_response
    people = ['GIRLFRIEND/BOYFRIEND/SPOUSE/PARTNER', 'FRIEND(S)', 'CO-WORKER',
              'CLASSMATE', 'OTHER PERSON YOU KNOW', 'FAMILY MEMBER',
              'STRANGER(S)']
    people_1 = people.sample
    people_2 = people.sample
    people_3 = people.sample
    find('.btn', text: people_1).click
    find('.btn', text: people_2).click
    find('.btn', text: people_3).click
  end

  def choose_with_children_response
    pick_yes_or_no
  end

  def choose_gathering_response
    pick_yes_or_no
  end

  def choose_non_intoxicating_substance
    substance = ['COFFEE', 'OTHER CAFFEINATED BEVERAGE',
                 'OTHER NON-CAFFEINATED BEVERAGE'].sample
    find('.btn', text: substance).click
  end

  def choose_intoxicating_substance
    substance = ['ALCOHOL', 'OTHER INTOXICATING SUBSTANCE'].sample
    find('.btn', text: substance).click
  end

  def choose_intoxicated_response
    pick_yes_or_no
  end

  private

  def pick_yes_or_no
    find('.form-control').find(:xpath, "option[#{[2, 3].sample}]").select_option
  end

  def set_first_value
    slider = first('.form-control')
    slider.drag_by(40, 0)
  end

  def set_second_value
    slider = all('.form-control')[1]
    slider.drag_by(-40, 0)
  end

  def set_third_value
    slider = all('.form-control')[2]
    slider.drag_by(80, 0)
  end

  def set_fourth_value
    slider = all('.form-control')[3]
    slider.drag_by(-80, 0)
  end

  def set_fifth_value
    slider = all('.form-control')[4]
    slider.drag_by(120, 0)
  end

  def set_sixth_value
    slider = all('.form-control')[5]
    slider.drag_by(-120, 00)
  end
end
