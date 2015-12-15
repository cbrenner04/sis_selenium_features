# page object for navigation
class Continue
  include Capybara::DSL

  def disabled?
    find('button[disabled = disabled]', text: 'CONTINUE')
  end

  def move_to_next_slide
    click_on 'Continue'
  end

  def visible?
    find('.btn.btn-primary', text: 'CONTINUE')
  end

  def select_continue
    find('.btn.btn-primary', text: 'CONTINUE').click
  end
end
