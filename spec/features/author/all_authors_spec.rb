require 'rails_helper'

describe "Show author index page", type: :feature do
  before do
    @author = FactoryBot.create :author
  end

  it "should render withour error" do
    visit authors_path
  end

  it "should have a link to the create authors route" do
    visit authors_path
    expect(page).to have_link 'new', href: new_author_path
  end

  it "should have a table head name" do
    visit authors_path
    expect(page.find(:id,"authorsTable").first(:xpath,'./tr/th').text).to eq("Name")
  end

  it "should have a table head homepage" do
    visit authors_path
    expect(page.find(:id,"authorsTable").all(:xpath,'./tr/th')[1].text).to eq("Homepage")
  end

  it "should link to author details" do
    visit authors_path
    expect(find(:table_row, {"Name" => @author.name}, {})).to have_link(href: author_path(@author))
  end

  it "should link to author edit" do
    visit authors_path
    expect(find(:table_row, {"Name" => @author.name}, {})).to have_link(href: edit_author_path(@author))
  end

  it "should be destroyed if destroy is submitted" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    author.save
    visit authors_path
    page.driver.submit :delete, author_path(author), {}
    expect(Author.exists?(author.id)).to be false
  end

  it "should show a delete link" do
    visit authors_path
    expect(find(:table_row, {"Name" => @author.name}, {})).to have_css("a[data-method='delete'][href='#{author_path(@author)}']")
  end
end
