require 'rails_helper'

describe "Show author page", type: :feature do
  before do
    @paper = FactoryBot.create :paper
  end

  it "should render withour error" do
    visit paper_path(@paper)
  end

  it "should have some text" do
    visit paper_path(@paper)
    expect(page).to have_text(@paper.title)
  end

  it "shows the author" do
    visit paper_path(@paper)
    expect(page).to have_text(@paper.authors[0].name)
  end
end
