# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:posts). dependent(:destroy) }
    it { should have_many(:comments). dependent(:destroy) }
    it { should have_many(:likes). dependent(:destroy) }
    it { should have_and_belong_to_many(:friendships) }
  end
end

describe  User do
  # Testing Validations
  it "has a valid factory" do 
    # FactoryBot.create(:user).should be_valid
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without email" do 
    # FactoryBot.build(:user, email: nil).should_not be_valid
    expect(FactoryBot.build(:user, email: nil)).not_to be_valid
  end

  it "is invalid without password" do
    expect(FactoryBot.build(:user, password: nil)).not_to be_valid
  end

  it "is invalid without name" do
    expect(FactoryBot.build(:user, name: nil)).not_to be_valid
  end

  it "does not allow user with same email" do
    user1 = FactoryBot.create(:user)
    expect(FactoryBot.build(:user, email: user1.email)).not_to be_valid
  end
  
end