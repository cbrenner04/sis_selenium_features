# frozen_string_literal: true
# page object for smoking cessation tool
class SmokingCessationTool
  include Capybara::DSL

  def open
    find('.btn', text: 'SMOKING CESSATION TOOLS').click
  end

  def open_tool(tool)
    find('.btn', text: tool).click
  end

  def click_done
    sleep(2)
    find('.btn-danger', text: 'Done').click
  end

  def visible?
    has_content? 'Smoking Cessation Tools'
  end
end
