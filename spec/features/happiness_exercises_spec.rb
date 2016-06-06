# frozen_string_literal: true
# filename: happiness_exercises_spec.rb

# require local storage data
# those that are not required here are common
# they are required in feature_helper
require './lib/local_storage/exercises'
require './lib/local_storage/exercise_answers'

# require page objects
require './lib/pages/happiness_exercises/example'
require './lib/pages/happiness_exercises/why_do_exercise'
require './lib/pages/happiness_exercises/why_does_happiness_help'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def examples
  @examples ||= HappinessExercises::Example.new
end

def why_does_happiness_help
  @why_does_happiness_help ||= HappinessExercises::WhyDoesHappinessHelp.new
end

def why_do_exercises
  @why_do_exercises ||= HappinessExercises::WhyDoExercise.new
end

feature 'Participant opens app' do
  after { navigation.clear_data }

  scenario 'completes \'Three Good Things\'' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.answer_question_with(1, 'First good thing')
    happiness_exercises.answer_question_with(2, 'Second good thing')
    happiness_exercises.answer_question_with(3, 'Third good thing')
    modal.save

    expect(modal).to have_success_alert_present
  end

  scenario 'completes \'Experiencing Kindness\'' do
    happiness_exercises.load('Experiencing Kindness')
    happiness_exercises.open('Experiencing Kindness')
    happiness_exercises.open('EXPERIENCING KINDNESS')
    happiness_exercises.answer_question_with(1, 'First kindness experience')
    happiness_exercises.answer_question_with(2, 'Second kindness experience')
    modal.save

    expect(modal).to have_success_alert_present
  end

  scenario 'completes \'Savoring\'' do
    happiness_exercises.load('Savoring')
    happiness_exercises.open('Savoring')
    happiness_exercises.open('SAVORING')
    happiness_exercises.answer_question_with(1, 'First savoring')
    happiness_exercises.answer_question_with(2, 'Second savoring')
    modal.save

    expect(modal).to have_success_alert_present
  end

  scenario 'uses help menus' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    examples.open

    expect(examples).to be_present

    modal.close
    why_does_happiness_help.open

    expect(why_does_happiness_help).to be_present

    modal.close
    why_do_exercises.open

    expect(why_do_exercises).to be_present

    modal.close
  end

  scenario 'exits happiness exercise without saving' do
    happiness_exercises.load('Three Good Things')
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open('THREE GOOD THINGS')
    modal.exit

    expect(page).to have_content '4 days until quit day'
  end

  scenario 'sees previous exercise responses' do
    happiness_exercises.load('Three Good Things')
    insert(Exercises::KEY, Exercises::ALL)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::ALL)
    happiness_exercises.open('Three Good Things')
    happiness_exercises.open_review

    expect(happiness_exercises).to have_previous_responses
  end
end
