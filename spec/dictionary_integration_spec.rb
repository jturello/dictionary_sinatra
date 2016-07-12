require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("root path '/'", {:type => :feature}) do
  it('displays the homepage') do
    visit('/')
    expect(page).to have_content('Dictionary - Word List')
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
