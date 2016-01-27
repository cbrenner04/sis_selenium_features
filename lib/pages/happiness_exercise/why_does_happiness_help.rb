class HappinessExercise
# page object for why happiness helps on happiness exercises page
  class WhyDoesHappinessHelp
    include Capybara::DSL

    def present?
      find('h3', text: 'Why Does Happiness Help?')
    end

    def open
      find('.text-transform-default',
           text: 'How does happiness help me quit smoking?').click
    end
  end
end
