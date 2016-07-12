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

  it("contains an 'add a word' link") do
    visit('/')
    
  end

end

# describe("root path '/'", {:type => :feature}) do
#   it('displays the homepage') do
#     visit('/')
#     fill_in('TEMPLATE', :with => 'SOMETHING')
#     click_button('Enter')
#     # save_and_open_page
#     expect(page).to have_content('SOME RESULT')
#   end
# end
