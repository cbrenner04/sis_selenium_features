# frozen_string_literal: true
module HappinessExercises
  # page object for examples on happiness exercises page
  class Example
    include Capybara::DSL

    def present?
      has_css?('h3', text: 'Examples')
    end

    def open
      find('.text-transform-default', text: 'Examples').click
    end
  end
end
