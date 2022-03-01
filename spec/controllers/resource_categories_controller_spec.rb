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
      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "a logged in person" do 
    it "denies access and redirects to the dashboard" do 
      resource_category_user = create(:user)
      resource_category_user.confirm 
      sign_in(resource_category_user)
      get :index
      expect(response).to redirect_to(dashboard_path)
      get :new 
      expect(response).to redirect_to(dashboard_path)
      get :create
      expect(response).to redirect_to(dashboard_path)
    end
  end
end

