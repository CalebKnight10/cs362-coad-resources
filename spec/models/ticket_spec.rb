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

  # describe "scopes" do
  #   describe "open" do 
  #     # given there is ticket in db
  #     open_ticket = Ticket.create!( name: 'Fake Ticket', description: 'Fake Ticket Description', phone: '+11234561234', organization: nil,
  #       closed: false, closed_at: nil, resource_category: create(:resource_category), region: create(:region) )
  #     closed_ticket = Ticket.create!(:closed)
  #     results = Ticket.open
  #     expect(results).to include(open_ticket)
  #     expect(results).to_not include(closed_ticket)
  #     # when retrieve open ticket
  #     # should have list of tickets open
  #     # and none that are not open
  #       end
  #     end
  #   end
  # end
  
end
