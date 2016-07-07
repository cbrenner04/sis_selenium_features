# frozen_string_literal: true
# page object for happiness exercises
class HappinessExercise
  include Capybara::DSL

  def load(exercise_name)
    loop do
      visit ENV['Base_URL']
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      navigation.reload
      break if has_css?('.btn', text: exercise_name)
      navigation.clear_data
    end
  end

  def open(exercise)
    find('.btn', text: exercise).click
  end

  def row(num)
    all('.row')[num + 1]
  end

  def answer_question_with(question, answer)
    fill_in "answer_#{question - 1}", with: answer
  end

  def pending?
    has_css?('.label-warning', text: 'still due today')
  end

  def completed?
    has_css?('.label-success', text: 'complete')
  end

  def open_review
    find('.btn', text: 'YOUR PAST ENTRIES').click
  end

  def has_previous_responses?
    find('.row', text: (Date.today - 4).strftime('%m/%d/%Y'))
      .has_text?('test test test') &&
      find('.row', text: (Date.today - 3).strftime('%m/%d/%Y'))
        .has_text?('test kindness test kindness') &&
      find('.row', text: (Date.today - 2).strftime('%m/%d/%Y'))
        .has_text?('test savoring test savoring')
  end
end
