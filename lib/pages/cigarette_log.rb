# frozen_string_literal: true
require 'support/capybara'

# page object for cigarette log
class CigaretteLog
  include Capybara::DSL

  def open
    find('.btn', text: 'CIGARETTE LOG').click
  end

  def click_1_cig
    find('.btn', text: '1 CIGARETTE').click
  end

  def click_2_cig
    find('.btn', text: '2+ CIGARETTES').click
  end

  def set_num_cigs
    find('input').set(rand(2..10).to_s)
  end

  def set_1000000_cigs
    find('input').set(1_000_000)
  end

  def set_reason
    find('select').click
    reason = ['Reduce craving', 'Cope with negative emotion',
              'Enhance positive emotion', 'Habit/automatic',
              'Opportunity to socialize', 'Break from work/studying',
              'Boredom/to kill time'].sample
    find('option', text: reason).click
  end

  def set_rating
    find(:xpath, '//input').drag_by(40, 0)
  end

  def open_view_graph
    find('.btn', text: 'VIEW GRAPH').click
  end
end
