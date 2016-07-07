# frozen_string_literal: true

require './lib/pages/risky_times_strategies/strategies_text'

# page object for risky times strategies
class RiskyTimesStrategy
  include Capybara::DSL
  include RiskyTimesStrategies::StrategiesText

  def open
    find('.btn-primary', text: 'help me choose a strategy').click
  end

  def exit
    find('button', text: 'CLOSE').click
  end

  def close_strategy_help
    all('button', text: 'CLOSE')[1].click
  end

  def open_negative_emotions_strategy
    open_strategy('NEGATIVE EMOTIONS')
  end

  def has_negative_strategy_present?
    has_strategies_present?(NEGATIVE_STRATEGIES)
  end

  def open_positive_emotions_strategy
    open_strategy('POSITIVE EMOTIONS')
  end

  def has_positive_strategy_present?
    has_strategies_present?(POSITIVE_STRATEGIES)
  end

  def open_social_situations_strategy
    open_strategy('SOCIAL SITUATIONS')
  end

  def has_social_strategy_present?
    has_strategies_present?(SOCIAL_STRATEGIES)
  end

  def open_drinking_alcohol_strategy
    open_strategy('DRINKING ALCOHOL')
  end

  def has_alcohol_strategy_present?
    has_strategies_present?(ALCOHOL_STRATEGIES)
  end

  def open_habitual_smoking_strategy
    open_strategy('HABITUAL SMOKING')
  end

  def has_habitual_smoking_strategy_present?
    has_strategies_present?(HABITUAL_SMOKING_STRATEGIES)
  end

  def open_hands_strategy
    open_strategy('WANTING SOMETHING TO DO WITH YOUR HANDS')
  end

  def has_hands_strategy_present?
    has_strategies_present?(HANDS_STRATEGIES)
  end

  private

  def open_strategy(strategy)
    find('.btn-primary', text: strategy).click
  end

  def has_strategies_present?(strategies)
    strategies.all? { |text| has_css?('.modal-body', text: text) }
  end
end
