# page object for navigation
class Continue
  include Capybara::DSL

  def disabled?
    find('button[disabled = disabled]', text: 'CONTINUE')
  end

  def move_to_next_slide
    click_on 'Continue'
  end
end
