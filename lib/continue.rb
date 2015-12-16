# page object for navigation
class Continue
  include Capybara::DSL

  def disabled?
    find('button[disabled = disabled]', text: 'CONTINUE')
  end

  def visible?
    find('.btn.btn-primary', text: 'CONTINUE')
  end

  def select_continue
    find('.btn.btn-primary', text: 'CONTINUE').click
  end

  def present?
    has_css?('.btn.btn-primary', text: 'CONTINUE')
  end
end
