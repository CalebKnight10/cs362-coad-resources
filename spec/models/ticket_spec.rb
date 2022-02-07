require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { build(:ticket) }

  describe "ticket" do 
    it { should belong_to :region }
    it { should belong_to :resource_category}
    it { should belong_to :organization }
  end

  describe "validations" do
    it "is invalid without a name" do
      expect(ticket.name).to eq("Fake Ticket Name")
    end
    it "is invalid without a phone number" do 
      expect(ticket.phone).to be_truthy
    end
    it "is invalid without a region ID" do
      expect(ticket.region_id).to eq(1)
    end
    it "is invalid without a resource category ID" do 
      expect(ticket.resource_category_id).to eq(1)
    end
    it "has a description" do 
      expect(ticket.description).to be_truthy
    end
    it "is invalide if the name is less than 1 or more than 255" do 
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
  end

  describe "methods" do 
    describe "open?" do 
      it "is an open ticket?" do 
        ticket.closed
        expect(ticket.open?).to eq(true)
      end
    end
    describe "captured?" do 
      it "has a present organization" do 
        ticket.organization.present?
        expect(ticket.captured?).to be(false)
      end
    end
    let(:ticket) { build(:ticket, name:"Ticket ") }
    describe "to_s" do 
      it "has a string representation that is its name" do 
        name = ticket.name
        expect(ticket.to_s).to eq(name)
      end
    end
  end
end
