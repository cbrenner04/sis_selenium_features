# frozen_string_literal: true
module HappinessExercises
  # page object for why happiness helps on happiness exercises page
  class WhyDoExercise
    include Capybara::DSL

    def present?
      has_css?('h3', text: 'Why Do 3 Good Things?')
    end

    def open
      find('.text-transform-default',
           text: 'How does this exercise help me quit smoking?').click
    end
  end
end
