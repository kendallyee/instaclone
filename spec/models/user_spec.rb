require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do

    it "should have name and email" do
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:email).of_type(:string)
    end
    describe "validates presence of attributes" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end
    context "associations" do
      it { is_expected.to have_many(:posts) }
      it { is_expected.to have_many(:comments) }
      it { is_expected.to have_many(:authentications).dependent(:destroy) }
    end
  end

#custom model test user full_name
  context "full_name" do

   it "should have first and last name" do
    @user = User.create(email: "bobsmith@gmail.com",
      first_name: "bob",
      last_name: "smith",
      password: "12345678",
      password_confirmation: "12345678")
    full_name = User.create(first_name: "bob", last_name: "smith")
    expect(@user.full_name).to eq("bob smith")
   end
 end
end
