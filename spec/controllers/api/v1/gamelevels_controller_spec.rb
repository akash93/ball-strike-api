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
end
