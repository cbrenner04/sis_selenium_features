# filename: configuration_spec.rb

describe 'On initial app load, the participant', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'is able to start the first session' do
    expect(page).to have_content 'START NOW'
  end
end
