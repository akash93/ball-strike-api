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
end
