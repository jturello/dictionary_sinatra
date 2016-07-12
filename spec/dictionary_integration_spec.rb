require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("root path '/'", {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Dictionary')
  end

  it('does not display a word list before any words are saved') do
    visit('/')
    expect(page).not_to have_content('Word List')
  end

  # it('displays the list of saved words') do
  #   visit('/')
  #
  # end

  it("navigates to the Add a Word Form page when user clicks the 'add a word' link") do
    visit('/')
    click_link('Add a Word')
    expect(page).to have_content('Add a Word Form')

  end

end

describe("'/word_form' path", {:type => :feature}) do
  it('XXXXXXXXXXX') do
    visit('/')
    click_link('Add a Word')
    expect(page).to have_content('Add a Word Form')
    fill_in('word', :with => 'conduct')
    fill_in('definition', :with => 'drive a train')
    # save_and_open_page
    click_button('Add')
    # expect(page).to have_content('drive a train')
  end
end
