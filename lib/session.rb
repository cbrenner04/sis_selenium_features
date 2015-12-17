# page object for sessions
class Session
  include Capybara::DSL

  def start
    assert_at_start
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

  def open
    find('.btn.btn-default', text: 'SMOKING CESSATION SESSIONS').click
  end

  private

  def start_button
    find('.btn.btn-primary', text: 'START NOW')
  end

  def assert_at_start
    find('p', text: 'Ready to begin?')
  end
end
