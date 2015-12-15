# page object for setting risky times in session 1
class Risky
  include Capybara::DSL

  def assert_on_correct_page
    find('h3', text: 'Difficult Times To Stay Smoke Free')
  end

  def open
    find('.btn.btn-info',
         text: "1, I'D LIKE TO SET MY RISKIEST SMOKING TIMES").click
  end

  def create
    select_day
    select_time
    set_reason
  end

  def select_day
    find('.btn-group.ng-scope', text: 'Tu').click
  end

  def select_time
    find('#risky_time_time').click
    sleep(1)
    time = Time.now.strftime('%I:%M')
    if time.between?('10:58', '12:00') || Time.now.strftime('%M') >= '58'
      find('.dwbw.dwb-s').click
      find('.well.modal-well', text: 'Add risky times below.')
    else
      risky_time = Time.now + (62 * 60)
      element_count(0, '.dw-i', "#{risky_time.strftime('%I')}")
      element_count(1, '.dw-i', "#{risky_time.strftime('%M')}")
      find('.dw-i', text: "#{risky_time.strftime('%p')}").click
    end
  end

  def set_reason
    fill_in 'reason', with: 'My reason'
  end

  def visible?
    if time.between?('10:58', '12:00') ||
       Time.now.strftime('%M') >= '58'
      find('.well.modal-well', text: "#{Time.now.strftime('%l:%M %p')}" \
                                     ' - Tuesday')
      find('.well.modal-well', text: 'My reason')
      find '.glyphicon-remove.glyphicon-sm'
    else
      risky_time = Time.now + (62 * 60)
      find('.well.modal-well', text: "#{risky_time.strftime('%l:%M %p')}" \
                                     ' - Tuesday')
      find('.well.modal-well', text: 'My reason')
      find '.glyphicon-remove.glyphicon-sm'
    end
  end
end
