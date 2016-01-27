class HappinessExercise
# page object for examples on happiness exercises page
  class Example
    include Capybara::DSL

    def present?
      find('h3', text: 'Examples')
    end

    def open
      find('.text-transform-default', text: 'Examples').click
    end
  end
end
