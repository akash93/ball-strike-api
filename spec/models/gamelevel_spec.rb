require 'rails_helper'

RSpec.describe Gamelevel, type: :model do
  before do
    @gamelevel = FactoryGirl.build :gamelevel
  end
  context 'response' do
    it { should respond_to(:num_enemies) }
    it { should respond_to(:num_balls) }
    it { should respond_to(:num_hits_per_enemy) }
  end

  context 'validation' do
    it { should validate_presence_of(:num_enemies) }
    it { should validate_presence_of(:num_balls) }
    it { should validate_presence_of(:num_hits_per_enemy) }
    it { should validate_numericality_of(:num_enemies).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:num_balls).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:num_hits_per_enemy).is_greater_than_or_equal_to(1) }
  end
end
