# page object for sessions
class Session
  include Capybara::DSL

  def start
    assert_app_configured
    start_button.click
  end

  def move_to_next_slide
    click_on 'Continue'
  end

  def finish
    find('.btn.btn-primary', text: 'GO HOME').click
  end

  def set_notes
    find('#notes').set('bad reason')
  end

  private

  def start_button
    find('.btn.btn-primary', text: 'START NOW')
  end

  def assert_app_configured
    find('p', text: 'Ready to begin?')
  end
end
