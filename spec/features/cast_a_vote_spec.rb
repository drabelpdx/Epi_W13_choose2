require "rails_helper"

describe "cast a vote" do
  it "casts a vote and returns a tally", js: true do
    question = FactoryGirl.create(:question)
    visit '/questions'
    click_on('Add a Question')
    fill_in 'Option a', with: question.option_a
    fill_in 'Option b', with: question.option_b
    click_on 'Create Question'
    click_link('Vote', match: :first)
    sleep 1
    save_and_open_screenshot

    expect(page).to have_content 'Votes:'
  end
end
