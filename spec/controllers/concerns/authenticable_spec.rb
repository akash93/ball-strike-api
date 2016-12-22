require 'rails_helper'

class Authentication < ActionController::Base
  include Authenticable
end

describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe '#current_user' do
    before do
      @user = FactoryGirl.create :user
      request.headers['Authentication'] = @user.auth_token
      allow(authentication).to receive(:request).and_return(request)
    end

    it 'returns the user based on authorization header ' do
      expect(authentication.current_user.auth_token).to eql @user.auth_token
    end
  end
end
