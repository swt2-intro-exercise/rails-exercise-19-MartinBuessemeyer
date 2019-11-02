require 'rails_helper'

describe "Edit author page", type: :feature do
  before do
    @author = FactoryBot.create :author
  end
  it "should render withour error" do
    visit edit_author_path(@author)
  end

  it "should change values of author" do
    visit edit_author_path(@author)
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'google.com'
    find('input[type="submit"]').click
    @author.reload
    expect(@author.homepage).to eq('google.com')
  end

  it "should show validation errors occured" do
    visit edit_author_path(@author)
    page.fill_in 'author[last_name]', with: ''
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end

  it "should explain errors" do
    visit edit_author_path(@author)
    page.fill_in 'author[last_name]', with: ''
    find('input[type="submit"]').click
    expect(page).to have_text('Last name can\'t be blank')
  end
end