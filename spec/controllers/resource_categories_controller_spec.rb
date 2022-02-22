require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "a non logged in person" do
    it "redirects to the sign in screen" do 
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      get :create
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      # get :new
      # expect(response).to redirect_to(new_user_session_path)
    end
  end

end
