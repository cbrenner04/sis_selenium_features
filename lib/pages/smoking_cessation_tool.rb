# page object for smoking cessation tool
class SmokingCessationTool
  include Capybara::DSL

  def open
    find('.wide.btn.btn-default', text: 'SMOKING CESSATION TOOLS').click
  end

  def open_reasons_tool
    find('.btn', text: 'YOUR REASONS FOR QUITTING').click
  end

  def open_benefits_tool
    find('.btn', text: 'BENEFITS OF QUITTING').click
  end

  def open_scheduling_tool
    find('.btn', text: 'SCHEDULING YOUR QUIT DAY').click
  end

  def open_concerns_tool
    find('.btn', text: 'CONCERNS ABOUT QUITTING').click
  end

  def open_risky_times_tool
    find('.btn', text: 'MANAGING YOUR CHALLENGING TIMES').click
  end

  def open_social_support_tool
    find('.btn', text: 'ENLISTING YOUR SOCIAL SUPPORT').click
  end
end
