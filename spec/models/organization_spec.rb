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

  describe "associations" do
    it "has many users" do
      expect(organization).to have_many(:users)
    end
    it "has many tickets" do
      expect(organization).to have_many(:tickets)
    end
    it "has and belongs to many resource categories" do
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end
  end

  describe "methods" do
    describe "#approve" do
      it "returns a status of 'approved'" do
        organization = build(:organization, :submitted)
        organization.approve
        expect(organization.status).to eq("approved")
      end
    end
    describe "#reject" do
      it "returns a status of 'rejected'" do
        organization = build(:organization, :submitted)
        organization.reject
        expect(organization.status).to eq("rejected")
      end
    end
    describe "#set_default_status" do
      it "sets the default status" do
        organization = build(:organization, :submitted)
        organization.set_default_status
        expect(organization.status).to eq("submitted")
      end
    end
    describe "#to_s" do
      it "has a string representation that is its name" do
        name = organization.name
        expect(organization.to_s).to eq(name)
      end
    end
  end
end
