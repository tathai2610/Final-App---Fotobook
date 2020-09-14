require 'rails_helper'

RSpec.describe "SignUps", type: :request do
  describe "GET /sign_ups" do
    it "works! template of the signup form" do
      get new_user_registration_path
      expect(response).to render_template('devise/registrations/new')
    end

    it "works! create not enough params" do

      post user_registration_path, :params => { :user => {:firsname => "Anthony", :lastname => "Hollywood", :password => "123123", :password_confirmation => "123123" } }
      expect(response).to render_template('devise/registrations/new')
    end

  end
end
