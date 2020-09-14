require 'rails_helper'

RSpec.describe "SignUps", type: :system do

  before do
     driven_by :selenium, using: :firefox
   end

  it "should show error messages when user not filling the form" do
    visit '/users/sign_up'
    click_button "Signup"

    expect(page).to have_text("Please enter")
  end

  it "should go to guest page when user signing up successfully" do
    visit '/users/sign_up'

    fill_in "user[firstname]", :with => "Anthony"
    fill_in "user[lastname]", :with => "Hollywood"
    fill_in "user[email]", :with => "anthonyhollywood@yopmail.com"
    fill_in "user[password]", :with => "123123"
    fill_in "user[password_confirmation]", :with => "123123"

    click_button "Signup"

    expect(page.current_path).to eq unauthenticated_root_path
  end
end
