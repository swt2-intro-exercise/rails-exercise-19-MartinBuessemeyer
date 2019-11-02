require 'rails_helper'

describe "Author", type: :feature do

  it "should have first_name, last_name and homepage as string attributes", type: :model do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "should have a method called name, which returns the first and last name as a string together", type: :model do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
    expect(author.name).to eq('Alan Turing')
  end

  it "should save the new author in the database" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    author = Author.where(:first_name => 'Alan', :last_name => 'Turing').first
    expect(author.name).to(eq("Alan Turing"))
  end

end
