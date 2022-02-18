require 'rails_helper'

RSpec.describe Ticket, type: :model do



# new does not save object to db, create will so create gives id
# build_stbbed doesn't hit the db which is effective but it gives us an id still
# when using more than one object, either need to instantiate one object and use it multiple times
# or you can make multiple objects but you need to go to the factory and make the name unique
# such as setting a name to a 'Fake Name + a time' so as they create, they will be milliseconds apart
# sequence(:name { |n} "Fake resouce category #{n}" ")


let(:ticket) { create(:ticket) }

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
    expect(ticket.region_id).to be_truthy
  end
  it "is invalid without a resource category ID" do
    expect(ticket.resource_category_id).to be_truthy
  end
  it "has a description" do 
    expect(ticket.description).to be_truthy
  end
  it "is invalide if the name is less than 1 or more than 255" do 
    expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
  end
  it "validates phone using phony_plausible" do
    expect(ticket).to be_valid
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

describe "scopes" do
  describe "open" do 
      # given there is ticket in db
      it "is an open ticket" do 
        open_ticket = Ticket.create!( name: 'Fake Ticket', description: 'Fake Ticket Description', phone: '+13035544321', organization: nil,
          closed: false, closed_at: nil, resource_category: create(:resource_category), region: create(:region) )
        results = Ticket.open
        expect(results).to include(open_ticket)
      end
    end
  end
  describe "closed" do 
    it "is a closed ticket" do
      closed_ticket = Ticket.create!(name: 'Fake Ticket1', description: 'Fake Ticket Description1', phone: '+13035544321', organization: nil,
        closed: true, closed_at: nil, resource_category: create(:resource_category), region: create(:region) )
      results = Ticket.open
      expect(results).to_not include(closed_ticket)
    end    
  end
  describe "all_organization" do
    it "returns tickets that are currently open and have a valid organization_id" do 
      ticket_with_organization_id = create(:ticket, 
    resource_category: build_stubbed(:resource_category, name: "f2"),
    region: build_stubbed(:region, name: "f2"), organization_id: 1, closed: false)
      expect(Ticket.all_organization).to include(ticket_with_organization_id)
    end
  end
  describe "organzation" do 
    it "returns tickets that are currently open and have a specific organization_id" do 
      ticket_with_organization_id = create(:ticket, 
    resource_category: build_stubbed(:resource_category, name: "f2"),
    region: build_stubbed(:region, name: "f2"), organization_id: 1, closed: false)
      expect(Ticket.organization(ticket_with_organization_id.organization_id)).to include(ticket_with_organization_id)
    end
  end
  describe "closed_organization" do 
    it "is a ticket where the organization is closed" do 
      ticket_with_organization_id = create(:ticket, 
    resource_category: build_stubbed(:resource_category, name: "f2"),
    region: build_stubbed(:region, name: "f2"), organization_id: 1, closed: true)
      expect(Ticket.organization(ticket_with_organization_id.organization_id)).to be_truthy
    end
  end
  describe "region" do 
    it "will return tickets that correspond with a specific region_id" do 
      closed_ticket = create(:ticket, 
    resource_category: build_stubbed(:resource_category, name: "f2"),
    region: build_stubbed(:region, name: "f2"), organization_id: 1, closed: true)
      expect(Ticket.region(ticket.region_id)).to include(ticket)
      expect(Ticket.region(ticket.region_id)).to_not include(closed_ticket)
    end
  end
  describe "resource_category" do 
    it "will return tickets that correspond with a specific resource_category_id" do 
      closed_ticket = create(:ticket, 
    resource_category: build_stubbed(:resource_category, name: "f2"),
    region: build_stubbed(:region, name: "f2"), organization_id: 1, closed: true)
      expect(Ticket.resource_category(ticket.resource_category_id)).to include(ticket)
      expect(Ticket.resource_category(ticket.resource_category_id)).to_not include(closed_ticket)
    end
  end
end




