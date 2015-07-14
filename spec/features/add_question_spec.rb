require "rails_helper"

describe "add question" do
  it "adds a new question to site" do
    question = FactoryGirl.create(:question)
    visit '/questions'
    click_on('Add a Question')
    fill_in 'Option a', with: question.option_a
    fill_in 'Option b', with: question.option_b
    click_on 'Create Question'
    expect(page).to have_content 'Option A'
  end
end
