require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "validations" do
    it "is invalid without an email" do
      expect(user).to be_valid
    end
    it "is invalid without a password" do
      expect(user).to be_valid
    end
    it "cannot have an email length greater than 255" do
      expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end
    it "cannot have an email without '@'" do
      user.email = "fake_email.com"
      expect(user).to be_invalid
    end
    it "cannot have an email without a domain" do
      user.email = "fake_email@test"
      expect(user).to be_invalid
    end
    it "is a unique email" do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end
    it "cannot have an password length greater than 255" do
      expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
    end
  end

  describe "associations" do
    it "should belong to an organization" do
      should belong_to :organization
    end
  end

  describe "methods" do
    describe "#set_default_role" do
      it "sets the default role" do
        user = build(:user, :organization)
        user.set_default_role
        expect(user.role).to eq("organization")
      end
    end
    describe "#to_s" do
      it "has a string representation that is its email" do
        email = user.email
        expect(user.to_s).to eq(email)
      end
    end
  end
end
