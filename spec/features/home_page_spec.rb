# filename: home_page_spec.rb

describe 'Participant opens app', type: :feature do
  before do
    visit 'localhost:8000'
  end

  after do
    page.execute_script('localStorage.clear()')
  end

  it 'shows cessation date in the future' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '4 days until quit day'
  end

  it 'shows cessation date is today' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content "It's Your Quit day"
  end

  it 'shows cessation date is in the past' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_content '7 days since you quit'
  end

  it 'shows only first session is available' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 2') do
      expect(page).to have_css('.label.label-lg.label-warning')
    end
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-info')
    end
  end

  it 'shows second session is available but 7 days from third' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-info', text: '7 days')
    end
  end

  it 'one day from third session' do
    insert_all(CessationDate::DATE_4, Sessions::SESSION_2)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-warning', text: '1 day')
    end
  end

  it 'shows third session is available' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.label.label-lg.label-success')
    end
  end

  it 'shows first session is complete' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 1') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 2') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows second session is complete' do
    insert_all(CessationDate::DATE_2, Sessions::SESSION_2)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 2') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
    within('.row', text: 'session 3') do
      expect(page).to_not have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows third session is complete' do
    insert_all(CessationDate::DATE_3, Sessions::SESSION_3)
    page.evaluate_script('window.location.reload()')
    within('.row', text: 'session 3') do
      expect(page).to have_css('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end

  it 'shows available good things exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::GOOD_THINGS)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
    within row[4] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows one complete, two available good things exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::GOOD_THINGS)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::GOOD_THINGS_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
    within row[4] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows two complete, one available good things exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::GOOD_THINGS)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::GOOD_THINGS_2)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[4] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows complete available good things exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::GOOD_THINGS)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::GOOD_THINGS_ALL)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'THREE GOOD THINGS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[4] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
  end

  it 'shows available experiencing kindness exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::EXP_KIND)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'EXPERIENCING KINDNESS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows one complete, one available experiencing kindness exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::EXP_KIND)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::EXP_KIND_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'EXPERIENCING KINDNESS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows complete experiencing kindness exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::EXP_KIND)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::EXP_KIND_ALL)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'EXPERIENCING KINDNESS')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
  end

  it 'shows available savoring exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::SAVORING)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'SAVORING')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows one available, one complete savoring exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::SAVORING)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::SAVORING_1)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'SAVORING')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-warning.ng-scope', text: 'pending')
    end
  end

  it 'shows complete savoring exercises' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    insert(Exercises::KEY, Exercises::SAVORING)
    insert(ExerciseAnswers::KEY, ExerciseAnswers::SAVORING_ALL)
    page.evaluate_script('window.location.reload()')
    expect(page).to have_css('.wide.btn.btn-default', text: 'SAVORING')
    row = page.all('.row')
    within row[2] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
    within row[3] do
      expect(page).to have_css('.label.label-lg.label-success.ng-scope', text: 'complete')
    end
  end

  it 'updates smoking status' do
    insert_all(CessationDate::DATE_1, Sessions::SESSION_1)
    page.evaluate_script('window.location.reload()')
    find('.wide.btn.btn-default.btn-sm', text: 'UPDATE YOUR STATUS').click
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[0].click
    expect(page).to have_content '4 days until quit day'

    find('.wide.btn.btn-default.btn-sm', text: 'UPDATE YOUR STATUS').click
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[1].click
    expect(page).to have_content '4 days until quit day'

    find('.wide.btn.btn-default.btn-sm', text: 'UPDATE YOUR STATUS').click
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[2].click
    expect(page).to have_content '4 days until quit day'

    find('.wide.btn.btn-default.btn-sm', text: 'UPDATE YOUR STATUS').click
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[3].click
    expect(page).to have_content '4 days until quit day'
  end
end
