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
end
