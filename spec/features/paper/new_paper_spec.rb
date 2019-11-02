require 'rails_helper'

describe 'New Paper' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

    it 'is created when  paper is valid' do
      count = Paper.count
      visit new_paper_path
      page.fill_in 'paper[year]', with: 2142
      page.fill_in 'paper[venue]', with: 'http://wikipedia.org/Alan_Turing'
      page.fill_in 'paper[title]', with: 'lololo rofl'
      find('input[type="submit"]').click
      expect(Paper.count).to eq(count + 1)
    end

  it 'is not  create  when paper is not valid' do
    count = Paper.count
    visit new_paper_path
    page.fill_in 'paper[venue]', with: 'http://wikipedia.org/Alan_Turing'
    page.fill_in 'paper[title]', with: 'lololo rofl'
    find('input[type="submit"]').click
    expect(Paper.count).to eq(count)
  end

  it 'is not  create  when paper is not valid' do
    count = Paper.count
    visit new_paper_path
    page.fill_in 'paper[year]', with: 2142
    page.fill_in 'paper[title]', with: 'lololo rofl'
    find('input[type="submit"]').click
    expect(Paper.count).to eq(count)
  end

  it 'is not  create  when paper is not valid' do
    count = Paper.count
    visit new_paper_path
    page.fill_in 'paper[year]', with: 2142
    page.fill_in 'paper[venue]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    expect(Paper.count).to eq(count)
  end

  it 'is not  create  when paper is not valid' do
    count = Paper.count
    visit new_paper_path
    page.fill_in 'paper[year]', with: 'alla'
    page.fill_in 'paper[venue]', with: 'http://wikipedia.org/Alan_Turing'
    page.fill_in 'paper[title]', with: 'lololo rofl'
    find('input[type="submit"]').click
    expect(Paper.count).to eq(count)
  end

  it 'is not  create  when paper is not valid' do
    count = Paper.count
    visit new_paper_path
    page.fill_in 'paper[year]', with: 2142
    page.fill_in 'paper[venue]', with: ''
    page.fill_in 'paper[title]', with: ''
    find('input[type="submit"]').click
    expect(Paper.count).to eq(count)
  end

end