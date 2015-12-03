# filename: happiness_exercises_spec.rb

describe 'Participant opens app', type: :feature do
  after do
    page.execute_script('localStorage.clear()')
  end

  it "completes 'Three Good Things'" do
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
      page.execute_script('localStorage.clear()')
    end
    find('.wide.btn.btn-default', text: 'THREE GOOD THINGS').click
    fill_in 'answer_0', with: 'First good thing'
    fill_in 'answer_1', with: 'Second good thing'
    fill_in 'answer_2', with: 'Third good thing'
    find('#save_button').click
    expect(page).to have_css('#success-alert')
  end

  it "completes 'Experiencing Kindness'" do
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default',
                             text: 'EXPERIENCING KINDNESS')
      page.execute_script('localStorage.clear()')
    end
    find('.wide.btn.btn-default', text: 'EXPERIENCING KINDNESS').click
    fill_in 'answer_0', with: 'First kindness experience'
    fill_in 'answer_1', with: 'Second kindness experience'
    find('#save_button').click
    expect(page).to have_css('#success-alert')
  end

  it "completes 'Savoring'" do
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default', text: 'SAVORING')
      page.execute_script('localStorage.clear()')
    end
    find('.wide.btn.btn-default', text: 'SAVORING').click
    fill_in 'answer_0', with: 'First savoring'
    fill_in 'answer_1', with: 'Second savoring'
    find('#save_button').click
    expect(page).to have_css('#success-alert')
  end

  it 'uses help menus' do
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
      page.execute_script('localStorage.clear()')
    end
    find('.wide.btn.btn-default', text: 'THREE GOOD THINGS').click
    find('.text-transform-default', text: 'Examples').click
    expect(page).to have_css('h3', text: 'Examples')
    find('.btn.btn-primary', text: 'CLOSE').click
    find('.text-transform-default',
         text: 'How does happiness help me quit smoking?').click
    expect(page).to have_css('h3', text: 'Why Does Happiness Help?')
    find('.btn.btn-primary', text: 'CLOSE').click
    find('.text-transform-default',
         text: 'How does this exercise help me quit smoking?').click
    expect(page).to have_css('h3', text: 'Why Do 3 Good Things?')
    find('.btn.btn-primary', text: 'CLOSE').click
  end

  it 'exits happiness exercise without saving' do
    loop do
      visit 'localhost:8000'
      insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
      page.execute_script('window.location.reload()')
      break if page.has_css?('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
      page.execute_script('localStorage.clear()')
    end
    find('.wide.btn.btn-default', text: 'THREE GOOD THINGS').click
    find('#exit_button', text: 'EXIT').click
    expect(page).to have_content '4 days until quit day'
  end
end
