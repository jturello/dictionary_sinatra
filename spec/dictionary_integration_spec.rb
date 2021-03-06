require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("root path '/'", {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Dictionary')
  end

  it('displays no word list before any are saved') do
    visit('/')
    expect(page).not_to have_content('Word List')
  end

  context("when 'add a word' link is clicked") do

    it("displays the Add a Word Form page") do
      visit('/')
      click_link('Add a Word')
      expect(page).to have_content('Add a Word Form')
    end
  end
end

describe("/word_form post path", {:type => :feature}) do
  it('displays the entered definition on Word Detail page after it is added') do
    visit('/')
    click_link('Add a Word')
    fill_in('word', :with => 'conduct')
    fill_in('definition', :with => 'drive a train')
    click_button('Add')
    expect(page).to have_content('drive a train')
  end
end

describe('/word post path', {:type => :feature}) do
  it('appends entered definition and redisplays the definition list') do
    visit('/')
    click_link('Add a Word')
    fill_in('word', :with => 'conduct')
    fill_in('definition', :with => 'drive a train')
    click_button('Add')
    fill_in('definition', :with => 'lead an orchestra')
    click_button('Add')
    expect(page).to have_content('drive a train')
    expect(page).to have_content('lead an orchestra')
  end
end
