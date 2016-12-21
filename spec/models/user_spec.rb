require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build :user}

  subject { @user }

  describe 'response' do

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
  end

  describe 'validation' do
    it {should be_valid}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email).ignoring_case_sensitivity}
    it {should validate_confirmation_of(:password)}
    it {should allow_value('user@example.com').for(:email)}
  
  end

  describe 'when email is absent' do
    before { @user.email = '' }
    it {should_not be_valid}
  end
end
