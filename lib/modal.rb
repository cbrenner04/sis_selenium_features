# page objects for modals
class Modal
  include Capybara::DSL

  def open
    find('.btn.btn-info').click
  end

  def save
    find('#save_button').click
  end

  def exit
    find('#exit_button').click
  end

  def disabled?
    find('#save_button[disabled = disabled]')
  end
end
