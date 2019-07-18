# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end

describe Comment do
  it "has valid Factory" do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  it "is invalid without commented post" do
    expect(FactoryBot.build(:comment, post_id: nil)).not_to be_valid
  end

  it "is invalid without commented user" do
    expect(FactoryBot.build(:comment, user_id: nil)).not_to be_valid
  end

  it "is invalid without comment content" do
    expect(FactoryBot.build(:comment, user_id: nil)).not_to be_valid
  end

  it "allows same user to comment on a post multiple times" do
    commenter = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    FactoryBot.create(:comment, user_id: commenter.id, post_id: post.id)
    expect(FactoryBot.build(:comment, user_id: commenter.id, post_id: post.id)).to be_valid
  end
end

