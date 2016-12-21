require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do
    request.headers['Accept'] = 'application/vnd.ballstrike.v1'
  end

  describe 'GET #show' do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, params: { id: @user.id }, format: :json
    end

    it 'returns information of user' do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it {should respond_with 200}
  end

  describe 'POST #create' do
  
    context 'Successful creation' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, params: { user: @user_attributes }, format: :json
      end

      it 'renders the json representation of user created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it 'contains location headers' do
        expect(response.headers).to have_key("Location")
      end

      it { should respond_with 201 }

    end

    context 'Invalid request' do
      before(:each) do
        @invalid_attributes = { password: 'password', password_confirmation: 'password' }
        post :create, params: { user: @invalid_attributes }, format: :json
      end

      it 'renders errors json' do
        user_response = JSON.parse(response.body, symbolize_names:true)
        expect(user_response).to have_key(:errors)
      end

      it 'renders error message stating reason' do
        user_response = JSON.parse(response.body, symbolize_names:true)
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it {should respond_with 422}
    end
  end
  
  describe 'PUT/PATCH #update' do
    
    context 'When update is successful' do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, params: {id: @user.id, user: {email: 'test@example.com'}}, format: :json
      end

      it 'renders json representation of updated user' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql 'test@example.com'
      end

      it 'sends location headers' do
        expect(response.headers).to have_key("Location")
      end

      it {should respond_with 200}

    end

    context 'When update fails' do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, params: {id: @user.id, user: {email: 'test.com'}}, format: :json
      end

      it 'renders error json' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it 'renders error message stating reason' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include 'is invalid'
      end

      it {should respond_with 422}
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = FactoryGirl.create :user
      delete :destroy, params: { id: @user.id}, format: :json
    end

    it {should respond_with 204}
  end
end
