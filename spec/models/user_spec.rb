require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build :user}

  subject { @user }

  describe 'response' do

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:auth_token)}
  end

  describe 'validation' do
    it { should be_valid }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('user@example.com').for(:email) }
    it { should validate_uniqueness_of(:auth_token) }
  
  end

  describe 'when email is absent' do
    before { @user.email = '' }
    it {should_not be_valid}
  end

  describe '#generate_auth_token!' do
    it 'generates a unique token' do
      allow(Devise).to receive(:friendly_token).and_return('uniquetoken')
      @user.generate_auth_token!
      expect(@user.auth_token).to eql 'uniquetoken'
    end

    it 'generates a new token on clash' do
      existing_user = FactoryGirl.create(:user, auth_token: 'randomtoken')
      @user.generate_auth_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end
end
