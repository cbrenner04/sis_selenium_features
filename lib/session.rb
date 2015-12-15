# page object for sessions
class Session
  include Capybara::DSL

  def start
    assert_app_configured
    start_button.click
  end

  def finish
    home_button.click
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

  def home_button
    find('.btn.btn-primary', text: 'GO HOME')
  end
end
