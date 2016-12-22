require 'rails_helper'

RSpec.describe Api::V1::GamelevelsController, type: :controller do

  describe 'GET #index' do
    before(:each) do
      5.times { FactoryGirl.create :gamelevel }
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      get :index
    end
  
    it 'returns total number of levels' do
      expect(json_response.size).to eql 5
    end

    it { should respond_with 200 }

  end

  describe 'POST #create' do
    before do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
    end
    context 'when level is successfully created' do
      before(:each) do
        @level_attributes = FactoryGirl.attributes_for :gamelevel
        post :create, params: { gamelevel: @level_attributes }, format: :json
      end

      it 'returns the json representation of level created' do
        expect(json_response[:num_enemies]).to eql @level_attributes[:num_enemies]
      end

      it { should respond_with 201 }
    end

  end
end
