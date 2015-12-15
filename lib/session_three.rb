# page object for session three
class SessionThree
  include Capybara::DSL

  def unavailable?
    within('.row', text: 'session 3') do
      find('.label-info')
    end
  end

  def available_in_7_days?
    within('.row', text: 'session 3') do
      find('.label.label-lg.label-info', text: '7 days')
    end
  end

  def available_in_1_day?
    within('.row', text: 'session 3') do
      find('.label.label-lg.label-warning', text: '1 day')
    end
  end

  def available_soon?
    within('.row', text: 'session 2') do
      find('.label-warning')
    end
  end

  def available?
    within('.row', text: 'session 3') do
      find('.label-success')
    end
  end

  def completed?
    within('.row', text: 'session 3') do
      find('.label-success')
      find('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end
end
