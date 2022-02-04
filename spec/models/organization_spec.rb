require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { build(:organization) }

  describe "validations" do
    it "is invalid without an email" do
      expect(organization).to be_valid
    end
    it "is invalid without an name" do
      expect(organization).to be_valid
    end
    it "is invalid without an phone number" do
      expect(organization).to be_valid
    end
    it "is invalid without a status" do
      expect(organization).to be_valid
    end
    it "is invalid without a primary name" do
      expect(organization).to be_valid
    end
    it "is invalid without a secondary name" do
      expect(organization).to be_valid
    end
    it "is invalid without a seconday phone number" do
      expect(organization).to be_valid
    end
    it "cannot have an email length greater than 255" do
      expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
    end
    it "cannot have a name length greater than 255" do
      expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "cannot have a description length greater than 1020" do
      expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
  end
end
