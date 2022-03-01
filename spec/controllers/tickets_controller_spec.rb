require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "a non logged in person" do 
    it "redirects to the sign in screen" do 
      expect { get :show, params: {id: 'FAKE'} }.to raise_error
      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

end
