# filename: happiness_exercises_spec.rb

# require local storage data
require 'local_storage/auth_token'
require 'local_storage/cessation_date'
require 'local_storage/cessation_reasons'
require 'local_storage/risky_times'
require 'local_storage/sessions'
require 'local_storage/social_supports'

# require page objects
require 'pages/happiness_exercise'
require 'pages/modal'

def examples
  @examples ||= Example.new
end

def why_does_happiness_help
  @why_does_happiness_help ||= WhyDoesHappinessHelp.new
end

def why_do_exercises
  @why_do_exercises ||= WhyDoExercise.new
end

describe 'Participant opens app', type: :feature do
  def load(exercise_name)
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default', text: exercise_name)
      page.execute_script('localStorage.clear()')
    end
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it "completes 'Three Good Things'" do
    load('THREE GOOD THINGS')
    happiness_exercises.open_three_good_things
    fill_in 'answer_0', with: 'First good thing'
    fill_in 'answer_1', with: 'Second good thing'
    fill_in 'answer_2', with: 'Third good thing'
    modal.save

    expect(modal).to have_success_alert_present
  end

  it "completes 'Experiencing Kindness'" do
    load('EXPERIENCING KINDNESS')
    happiness_exercises.open_experiencing_kindness
    fill_in 'answer_0', with: 'First kindness experience'
    fill_in 'answer_1', with: 'Second kindness experience'
    modal.save

    expect(modal).to have_success_alert_present
  end

  it "completes 'Savoring'" do
    load('SAVORING')
    happiness_exercises.open_savoring
    fill_in 'answer_0', with: 'First savoring'
    fill_in 'answer_1', with: 'Second savoring'
    modal.save

    expect(modal).to have_success_alert_present
  end

  it 'uses help menus' do
    load('THREE GOOD THINGS')
    happiness_exercises.open_three_good_things
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
    happiness_exercises.open_three_good_things
    modal.exit

    expect(page).to have_content '4 days until quit day'
  end
end
