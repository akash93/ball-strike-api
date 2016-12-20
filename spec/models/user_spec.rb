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
  end
end
