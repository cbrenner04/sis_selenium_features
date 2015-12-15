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

  def view_examples
    find('.text-transform-default', text: 'Examples').click
  end

  def open_how_does_happiness_help_me
    find('.text-transform-default',
         text: 'How does happiness help me quit smoking?').click
  end

  def open_how_does_this_exercise_help
    find('.text-transform-default',
         text: 'How does this exercise help me quit smoking?').click
  end
end
