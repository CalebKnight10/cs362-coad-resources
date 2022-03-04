require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "a non logged in person" do
    it "redirects to the sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
