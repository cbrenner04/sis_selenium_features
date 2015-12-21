# page object for cigarette log
class CigaretteLog
  include Capybara::DSL

  def open
    find('.wide.btn.btn-default', text: 'CIGARETTE LOG').click
  end

  def set_reason
    find('select').click
    reason = ['Reduce craving', 'Cope with negative emotion',
              'Enhance positive emotion', 'Habit/automatic',
              'Opportunity to socialize', 'Break from work/studying',
              'Boredom/to kill time', 'other'].sample
    choose reason
  end

  def set_rating
    slider = find('.form-control')
    slider.drab_by(0, 40)
  end
end
