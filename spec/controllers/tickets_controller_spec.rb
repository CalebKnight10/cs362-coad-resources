require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "a non logged in person" do 
    it "redirects to the sign in screen" do 
      expect { get :show, params: {id: 'FAKE'} }.to raise_error
      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "a logged in person" do 
    it "directs person to new ticket page" do 
      ticket_user = create(:user)
      ticket_user.confirm
      sign_in(ticket_user)
      get :new, params: {id: 'FAKE'}
      expect(response).to be_success
    end 
    it "redirects user" do 
      ticket_user = create(:user)
      ticket_user.confirm
      sign_in(ticket_user)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      get :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
