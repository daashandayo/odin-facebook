# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:posts). dependent(:destroy) }
    it { should have_many(:comments). dependent(:destroy) }
    it { should have_many(:likes). dependent(:destroy) }
    it { should have_and_belong_to_many(:friendships) }
  end
end
