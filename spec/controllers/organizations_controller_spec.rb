require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  describe "a non logged in user" do 
    it "redirects to the sign in screen" do 
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
