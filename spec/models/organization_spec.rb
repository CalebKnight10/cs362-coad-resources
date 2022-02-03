require 'rails_helper'

RSpec.describe Organization, type: :model do

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
  


  describe "validations" do

    it "is invalid without an email" do
      expect(organization).to be_invalid
    end

  end
end
