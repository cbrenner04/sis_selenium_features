# page object for cigarette log
class CigaretteLog
  include Capybara::DSL

  def open
    find('.wide.btn.btn-default', text: 'CIGARETTE LOG').click
  end

  def set_reason
    radio = ['Reduce craving', 'Cope with negative emotion',
             'Enhance positive emotion', 'Habit/automatic',
             'Opportunity to socialize', 'Break from work/studying',
             'Boredom/to kill time', 'other'].sample
    choose radio
  end

  def set_rating
    find('.form-control').click
    find('.form-control').all('option')[rand(11)].select_option
  end

  def save
    find('.btn.btn-primary', text: 'SAVE').click
  end

  def choose_smoking_now
    find('.btn.btn-lg', text: "I'M SMOKING NOW...").click
  end

  def choose_forgot_to_enter
    find('.btn.btn-lg', text: 'I FORGOT TO ENTER A CIGARETTE').click
  end
end
