require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { build(:ticket) }

  describe "validations" do
    it "is invalid without a name" do
      expect(ticket).to be_valid
    end
    it "is invalid without a phone number" do 
      expect(ticket).to validate_presence_of(:phone)
    end
    it "is invalid without a region ID" do
      expect(ticket).to validate_presence_of(:region_id)
    end
    it "is invalid without a resource category ID" do 
      expect(ticket).to validate_presence_of(:resource_category_id)
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
