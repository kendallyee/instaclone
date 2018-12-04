require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'Association' do
    it { is_expected.to belong_to(:user) }
  end

  context " search" do
  #happy path
    it "if search by valid term for caption" do

      @user = User.create(email: "bobsmith@gmail.com", first_name: "bob", last_name: "smith", password: "12345678", password_confirmation: "12345678")
      @post = Post.create(caption: "Car", user_id: @user.id)
      @result = Post.search_by_posts("Car")
      expect(@result.first.caption).to eq("Car")
    end

  #edgy path
    it "if search by invalid term for caption" do

      @user = User.create(email: "bobsmith@gmail.com", first_name: "bob", last_name: "smith", password: "12345678", password_confirmation: "12345678")
      @post = Post.create(caption: "Car", user_id: @user.id)
      @result = Post.search_by_posts("what is this")
      expect(@result.any?).to eq(false)
    end
  end

  context "is belongs to (user)" do
    it "if the post is belong to user" do
      @user = User.create(email: "bobsmith@gmail.com", first_name: "bob", last_name: "smith", password: "12345678", password_confirmation: "12345678")
      @post = Post.create(caption: "Car", user_id: @user.id)
      expect(@post.is_belongs_to?(@user)).to eq(true)

    end
  end
end
