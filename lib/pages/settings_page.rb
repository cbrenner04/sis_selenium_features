# frozen_string_literal: true
# page object for settings page
class SettingsPage
  include Capybara::DSL

  def open
    find('#setup-menu').click
  end

  def assert_on_page
    find('h3', text: 'Set Up')
  end

  def save
    find('#save_button').click
  end

  # needed when all settings complete due to ambiguous match using modal.save
  def save_modal
    all('#save_button')[1].click
  end

  def open_risky_times
    find('.btn-info', text: 'YOUR RISKY TIMES').click
  end

  def has_cessation_date_selector_present?
    has_css?('.dw_ltr', text: Date.today.strftime('%m/%d/%Y'))
  end

  def has_save_present?
    has_css?('#save_button')
  end
end
