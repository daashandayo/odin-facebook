# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:likes). dependent(:destroy) }
    it { should have_many(:comments). dependent(:destroy) }
  end
end

describe Post do
  it "has valid Factory" do
    expect(FactoryBot.build(:post)).to be_valid
  end

  it "is invalid without content" do
    expect(FactoryBot.build(:post, content: nil)).not_to be_valid
  end

  it "is invalid without author" do
    expect(FactoryBot.build(:post, user_id: nil)).not_to be_valid
  end

  it "allows multiple posts from same author" do
    author = FactoryBot.create(:user)
    FactoryBot.create(:post, user_id: author.id)
    expect(FactoryBot.build(:post, user_id: author.id)).to be_valid
  end
end
