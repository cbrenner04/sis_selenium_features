# page object for happiness exercises
class HappinessExercise
  include RSpec::Matchers
  include Capybara::DSL

  def open(exercise)
    find('.btn', text: exercise).click
  end

  def row(num)
    rows = page.all('.row')
    r = num + 1
    rows[r]
  end

  def answer_question_with(question, answer)
    q = question - 1
    fill_in "answer_#{q}", with: answer
  end

  def pending?
    find('.label-warning', text: 'pending')
  end

  def completed?
    find('.label-success', text: 'complete')
  end

  def open_review
    find('.btn', text: 'YOUR PAST ENTRIES').click
  end

  def has_previous_responses?
    date = Date.today - 4
    within('.row',
           text: "(#{date.strftime('%m/%d/%Y')}) Please describe three" \
                 ' good things that happened to you today:') do
      expect(page).to have_content 'test test test'
    end

    date = Date.today - 3
    within('.row',
           text: "(#{date.strftime('%m/%d/%Y')}) Please describe two " \
                 'acts of kindness: a kindness you did, and a kindness') do
      expect(page).to have_content 'test kindness test kindness'
    end

    date = Date.today - 2
    within('.row',
           text: "(#{date.strftime('%m/%d/%Y')}) Please describe " \
                 'experiences that you savored in the past four hours') do
      expect(page).to have_content 'test savoring test savoring'
    end
  end
end
