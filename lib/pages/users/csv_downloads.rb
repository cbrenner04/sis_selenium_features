# frozen_string_literal: true

module Users
  # page object for CSVs
  class Csv
    include RSpec::Matchers
    include Capybara::DSL

    def check_labels(report:, expected_labels:)
      first('.pjax', text: report).click
      click_on 'Export found ' + report
      labels = all('label')
      max = expected_labels.length + 1
      actual_labels = (2..max).map { |label_id| labels[label_id].text }
      expect(actual_labels).to eq expected_labels
    end
  end
end
