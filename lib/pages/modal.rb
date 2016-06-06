# frozen_string_literal: true
# page objects for modals
class Modal
  include Capybara::DSL

  def open
    find('.btn-info').click
  end

  def save
    find('#save_button').click
  end

  def exit
    find('#exit_button').click
  end

  def close
    find('.btn-primary', text: 'CLOSE').click
  end

  def disabled?
    has_css?('#save_button[disabled = disabled]')
  end

  def has_success_alert_present?
    has_css?('#success-alert')
  end
end
