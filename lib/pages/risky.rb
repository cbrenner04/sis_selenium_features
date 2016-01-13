# require 'rspec/expectations'

# page object for setting risky times in session 1
class Risky
  include Capybara::DSL
  include RSpec::Matchers

  def create
    select_time
    select_recurrence
    set_reason
    set_strategy
  end

  def select_time
    find('#risky_time_time').click
    sleep(2)
    find('.dw-mon', text: "#{Date.today.strftime('%B')}").click
  end

  def select_recurrence
    @label = %w(ONCE DAILY WEEKLY).sample
    find('.btn', text: @label).click
  end

  def set_reason
    fill_in 'reason', with: 'My reason'
  end

  def set_strategy
    find('select').click
    @value = ['exercise', 'socialize', 'do something pleasant',
              'do something kind', 'distract yourself', 'remember self-care',
              'treat yourself', 'savor', 'share your happiness',
              'realize there is plenty more', 'enlist a friend to help',
              'be elsewhere', 'keep your hands busy',
              'realize you are helping others',
              'plan smoke-free outings', 'avoid drinking',
              'trash the smoking supplies', "enlist friends' help",
              'arrange for activities', 'change your routine',
              'change what you do right after', 'use mints',
              'chew on something', 'bring something else',
              'make coffee or tea', 'use hand lotion',
              'engage in an activity'].sample
    find("option[value = '#{@value}']").click
  end

  def visible?
    exp_time_hour = Time.now.strftime('%-l')
    act_time_hour = find('.well.modal-well').text[0..4].gsub(/:\w+/, '')
    subt_hour = act_time_hour.to_i - exp_time_hour.to_i

    exp_time_min = Time.now.strftime('%M')
    act_time_min = find('.well.modal-well').text[0..4].gsub(/\w+:/, '')
    subt_min = act_time_min.to_i - exp_time_min.to_i

    if subt_hour.between?(0, 1) && subt_min.between?(0, 1)
      find('.well.modal-well',
           text: "#{act_time_hour.delete(' ')}:#{act_time_min.delete(' ')}")
    else
      expect(subt_hour).to be < 2,
                           'Expected and actual time are not within 1 hour'
      expect(subt_min).to be < 2,
                          'Expected and actual time are not within 1 minute'
    end

    if @label.downcase == 'once'
      find('.well.modal-well', text: "#{Date.today.strftime('%A (%m/%d/%Y)')}" \
                                     " My reason Strategy: #{@value}")
    else
      find('.well.modal-well', text: "#{Date.today.strftime('%A (%m/%d/%Y)')}" \
                                     " My reason (occurs #{@label.downcase}) " \
                                     "Strategy: #{@value}")
    end
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
