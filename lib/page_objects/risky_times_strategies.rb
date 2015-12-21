# page object for risky times strategies
class RiskyTimesStrategy
  include Capybara::DSL

  def open
    find('.btn.btn-primary', text: 'help me choose a strategy').click
  end

  def exit
    find('button', text: 'CLOSE').click
  end

  def close_strategy_help
    first('button', text: 'CLOSE').click
  end

  def open_negative_emotions_strategy
    find('.btn.btn-primary', text: 'NEGATIVE EMOTIONS').click
  end

  def has_negative_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the negative emotions strategy.')
  end

  def open_positive_emotions_strategy
    find('.btn.btn-primary', text: 'POSITIVE EMOTIONS').click
  end

  def has_positive_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the positive emotions strategy.')
  end

  def open_social_situations_strategy
    find('.btn.btn-primary', text: 'SOCIAL SITUATIONS').click
  end

  def has_social_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the social situations strategy.')
  end

  def open_drinking_alcohol_strategy
    find('.btn.btn-primary', text: 'DRINKING ALCOHOL').click
  end

  def has_alcohol_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the drinking alcohol strategy.')
  end

  def open_habitual_smoking_strategy
    find('.btn.btn-primary', text: 'HABITUAL SMOKING').click
  end

  def has_habitual_smoking_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the habitual smoking strategy.')
  end

  def open_hands_strategy
    find('.btn.btn-primary',
         text: 'WANTING SOMETHING TO DO WITH YOUR HANDS').click
  end

  def has_hands_strategy_present?
    has_css?('.modal-body',
             text: 'This is a description of the \'wanting something to do w' \
                   'ith your hands\' strategy.')
  end
end
