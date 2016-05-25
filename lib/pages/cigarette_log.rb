require 'support/capybara'

# page object for cigarette log
class CigaretteLog
  include Capybara::DSL

  def open
    find('.btn', text: 'CIGARETTE LOG').click
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
end
