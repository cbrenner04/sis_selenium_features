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

  def close
    find('.btn.btn-primary', text: 'CLOSE').click
  end

  def disabled?
    find('#save_button[disabled = disabled]')
  end

  def has_success_alert_present?
    find('#success-alert')
  end
end
