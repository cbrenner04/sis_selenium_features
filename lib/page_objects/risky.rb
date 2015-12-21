# page object for setting risky times in session 1
class Risky
  include Capybara::DSL

  def open
    find('.btn.btn-info',
         text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
  end

  def create
    select_time
    set_reason
    set_strategy
  end

  def select_time
    find('#risky_time_time').click
    sleep(2)
    find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
  end

  def set_reason
    fill_in 'reason', with: 'My reason'
  end

  def set_strategy
    find('select').click
    find("option[value = 'negative emotions'")
      .click
  end

  def visible?
    find('.well.modal-well', text: "#{Time.now.strftime('%-l:%M %p')} - " \
                                   "#{Date.today.strftime('%A (%m/%d/%Y)')}" \
                                   ' My reason Strategy: negative emotions')
    find '.glyphicon-remove.glyphicon-sm'
  end

  def has_two_risky_times_present?
    find('.glyphicon-remove.glyphicon-sm', count: 2)
  end

  def has_test_risky_time_present?
    has_css?('.well.modal-well', text: 'Test Risky Time')
  end

  def remove
    first('.glyphicon.glyphicon-remove.glyphicon-sm').click
  end
end
