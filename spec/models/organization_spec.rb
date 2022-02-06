require 'rails_helper'

RSpec.describe Organization, type: :model do

<<<<<<< HEAD
  let (:organization) {
    organization = Organization.new(
      status: "Fake Status",
      phone: "555-123-4567",
      email: "fake@example.com",
      description: "Fake Description",
      rejection_reason: "Fake Reason",
      liability_insurance: "Fake Insurance",
      primary_name: "Fake First Name",
      secondary_name: "Fake Second Name",
      secondary_phone: "555-555-5432",
      title: "Fake Title",
      transportation: "Fake Car")
  }

=======
  let(:organization) { build(:organization) }
>>>>>>> 84de22ab6ceb6856369736515dd8161a9fbcf1c6

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
    it "is a unique email" do
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end
    it "is a unique name" do
      expect(organization).to validate_uniqueness_of(:name).case_insensitive
    end
    it "cannot have an email without '@'" do
      organization.email = "fake_email.com"
      expect(organization).to be_invalid
    end
    it "cannot have an email without a domain" do
      organization.email = "fake_email@test"
      expect(organization).to be_invalid
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
