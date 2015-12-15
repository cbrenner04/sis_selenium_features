# page object for happiness exercises
class HappinessExercise
  include Capybara::DSL

  def open_three_good_things
    find('.wide.btn.btn-default', text: 'THREE GOOD THINGS').click
  end

  def open_experiencing_kindness
    find('.wide.btn.btn-default', text: 'EXPERIENCING KINDNESS').click
  end

  def open_savoring
    find('.wide.btn.btn-default', text: 'SAVORING').click
  end

  def row_1
    row = page.all('.row')
    row[2]
  end

  def row_2
    row = page.all('.row')
    row[3]
  end

  def row_3
    row = page.all('.row')
    row[4]
  end

  def pending?
    find('.label-warning.ng-scope', text: 'pending')
  end

  def completed?
    find('.label-success.ng-scope', text: 'complete')
  end
end

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

# page object for why happiness helps on happiness exercises page
class WhyDoExercise
  include Capybara::DSL

  def present?
    find('h3', text: 'Why Do 3 Good Things?')
  end

  def open
    find('.text-transform-default',
         text: 'How does this exercise help me quit smoking?').click
  end
end
