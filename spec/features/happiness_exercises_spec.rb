# filename: happiness_exercises_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'
require 'local_storage/exercises'
require 'local_storage/exercise_answers'

# require page objects
require 'pages/happiness_exercise'
require 'pages/happiness_exercise/example'
require 'pages/happiness_exercise/why_do_exercise'
require 'pages/happiness_exercise/why_does_happiness_help'
require 'pages/modal'

# instantiate page objects
# those that are not instantiated here are common
# therefore instantiated in the feature_helper
def examples
  @examples ||= HappinessExercise::Example.new
end

def why_does_happiness_help
  @why_does_happiness_help ||= HappinessExercise::WhyDoesHappinessHelp.new
end

def why_do_exercises
  @why_do_exercises ||= HappinessExercise::WhyDoExercise.new
end

def load(exercise_name)
  loop do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
    break if page.has_css?('.btn', text: exercise_name)
    page.execute_script('localStorage.clear()')
  end
end

describe 'Participant opens app', type: :feature do
  after do
    page.execute_script('localStorage.clear()')
  end

  it "completes 'Three Good Things'" do
    load('THREE GOOD THINGS')
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.answer_question_with(1, 'First good thing')
    happiness_exercises.answer_question_with(2, 'Second good thing')
    happiness_exercises.answer_question_with(3, 'Third good thing')
    modal.save

    expect(modal).to have_success_alert_present
  end

  it "completes 'Experiencing Kindness'" do
    load('EXPERIENCING KINDNESS')
    happiness_exercises.open('EXPERIENCING KINDNESS')
    happiness_exercises.answer_question_with(1, 'First kindness experience')
    happiness_exercises.answer_question_with(2, 'Second kindness experience')
    modal.save

    expect(modal).to have_success_alert_present
  end

  it "completes 'Savoring'" do
    load('SAVORING')
    happiness_exercises.open('SAVORING')
    happiness_exercises.answer_question_with(1, 'First savoring')
    happiness_exercises.answer_question_with(2, 'Second savoring')
    modal.save

    expect(modal).to have_success_alert_present
  end

  it 'uses help menus' do
    load('THREE GOOD THINGS')
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

  it 'exits happiness exercise without saving' do
    load('THREE GOOD THINGS')
    happiness_exercises.open('THREE GOOD THINGS')
    modal.exit

    expect(page).to have_content '4 days until quit day'
  end

  it 'sees previous exercise responses' do
    load('THREE GOOD THINGS')
    insert(Exercises::KEY, Exercises::ALL)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::ALL)
    happiness_exercises.open('THREE GOOD THINGS')
    happiness_exercises.open_review

    expect(happiness_exercises).to have_previous_responses
  end
end
