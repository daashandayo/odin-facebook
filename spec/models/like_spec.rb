# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end

describe Like do
  it "has valid Factory" do
    expect(FactoryBot.build(:like)).to be_valid
  end

  it "is invalid without Liked post" do
    expect(FactoryBot.build(:like, post_id: nil)).not_to be_valid
  end

  it "is invalid without Liked user" do
    expect(FactoryBot.build(:post, user_id: nil)).not_to be_valid
  end

  it "does not allow same user to like a post multiple times" do
    liker = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    # Like.create(user_id: liker.id, post_id: post.id)
    FactoryBot.create(:like, user_id: liker.id, post_id: post.id)
    expect(FactoryBot.build(:like, user_id: liker.id, post_id: post.id)).not_to be_valid
  end
end

