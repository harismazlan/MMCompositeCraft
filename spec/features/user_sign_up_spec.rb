require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do
	describe "the signin process", type: :feature do
		before :each do
			User.create!(first_name: 'afadf', last_name: 'asfdffgf', email: 'user@example.com', password: 'password', phone_number: 'dfsjdfsdf')
  		end

  		it "signs me in" do
		    visit '/login'
		    within("form") do
		      fill_in 'Email', with: 'user@example.com'
		      fill_in 'Password', with: 'password'
    		end
			click_button 'Login'
    		expect(page).to have_content 'Logged in!'
  		end
	end
end
