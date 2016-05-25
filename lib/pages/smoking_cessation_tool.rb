# page object for smoking cessation tool
class SmokingCessationTool
  include Capybara::DSL

  def open
    find('.btn', text: 'SMOKING CESSATION TOOLS').click
  end

  def open_tool(tool)
    find('.btn', text: tool).click
  end
end
