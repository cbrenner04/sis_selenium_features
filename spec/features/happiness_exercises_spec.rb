# filename: happiness_exercises_spec.rb

require 'happiness_exercise'
require 'modal'

def happiness_exercises
  HappinessExercise.new
end

def load(exercise_name)
  loop do
    visit 'localhost:8000'
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.execute_script('window.location.reload()')
    break if page.has_css?('.wide.btn.btn-default', text: exercise_name)
    page.execute_script('localStorage.clear()')
  end
end

describe 'Participant opens app', type: :feature do
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

    expect(page).to have_css('#success-alert')
  end

  it "completes 'Experiencing Kindness'" do
    load('EXPERIENCING KINDNESS')
    happiness_exercises.open_experiencing_kindness
    fill_in 'answer_0', with: 'First kindness experience'
    fill_in 'answer_1', with: 'Second kindness experience'
    modal.save

    expect(page).to have_css('#success-alert')
  end

  it "completes 'Savoring'" do
    load('SAVORING')
    happiness_exercises.open_savoring
    fill_in 'answer_0', with: 'First savoring'
    fill_in 'answer_1', with: 'Second savoring'
    modal.save

    expect(page).to have_css('#success-alert')
  end

  it 'uses help menus' do
    load('THREE GOOD THINGS')
    happiness_exercises.open_three_good_things
    happiness_exercises.view_examples

    expect(page).to have_css('h3', text: 'Examples')

    modal.close
    happiness_exercises.open_how_does_happiness_help_me

    expect(page).to have_css('h3', text: 'Why Does Happiness Help?')

    modal.close
    happiness_exercises.open_how_does_this_exercise_help

    expect(page).to have_css('h3', text: 'Why Do 3 Good Things?')

    modal.close
  end

  it 'exits happiness exercise without saving' do
    load('THREE GOOD THINGS')
    happiness_exercises.open_three_good_things
    modal.exit

    expect(page).to have_content '4 days until quit day'
  end
end
