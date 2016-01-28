# page object for navigation
class Continue
  include Capybara::DSL

  def disabled?
    find('button[disabled = disabled]', text: 'CONTINUE')
  end

  def visible?
    has_css?('.btn-primary', text: 'CONTINUE')
  end

  def select_continue
    find('.btn-primary', text: 'CONTINUE').click
  end
end
