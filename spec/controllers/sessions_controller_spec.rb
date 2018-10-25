require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /login' do
    it 'render new with invalid params' do
      post :create, params: {session: {email: "", password: ""}}
      expect(response).to render_template(:new)
    end
    
    it 'create flash of danger with invalid params' do
      post :create, params: {session: {email: "", password: ""}}
      expect(flash[:danger]).not_to be_blank
    end

    it 'delete flash-message by moving other pages' do
      post :create, params: {session: {email: "", password: ""}}
      get :new
      expect(flash.now[:danger]).to be_blank
    end

  end

end
