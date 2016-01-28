# page object for sessions
class Session
  include Capybara::DSL

  def start
    sleep(1)
    find('p', text: 'Ready to begin?')
    find('.btn-primary', text: 'START NOW').click
  end

  def move_to_next_slide
    click_on 'Continue'
  end

  def finish
    find('.btn-primary', text: 'GO HOME').click
  end

  def set_notes
    find('textarea').set('These are some notes')
  end

  def open
    find('.btn-default', text: 'SMOKING CESSATION SESSIONS').click
  end
end
