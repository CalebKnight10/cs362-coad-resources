require 'rails_helper'

RSpec.describe Region, type: :model do

  it "exists" do
    Region.new
  end

  describe "attributes" do
    it "has a name" do
      region = Region.new
      expect(region).to respond_to(:name)
    end
  end

  describe "#to_s" do
    it "has a string representation that is its name" do
      region = Region.new(name: 'Mt. Hood')
      result = region.to_s
      expect(result).to eq('Mt. Hood')
    end
  end

  describe "::unspecified" do
    it "returns a Region with the name 'Unspecified'" do
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end
  end

  describe "associations" do
    it "has many tickets" do
      expect(Region.new).to have_many(:tickets)
    end
  end

  describe "uniqueness" do 
    it "is not case senstive" do
      name = 'Fake Name'
      region = Region.create!(name: name)
      region_two = Region.new(name: 'Unique Name')
      expect(region).to be_valid
      region_two = region.dup
      expect(region_two).to be_invalid
      region_two.name = name.downcase
      expect(region_two).to be_invalid
    end
  end

  describe "length of name" do
    it "can't be blank" do
      name = 'Fake Region'
      region = Region.create!(name: name)
      expect(region).to be_valid
      region.name = ''
      expect(region).to_not be_valid
    end
    it "can't have length greater than 255" do
      # name = 'Fake Region'
      # region = Region.create!(name: name)
      # expect(region).to be_valid
      expect(region).to 
       validate_length_of(:name).
       is_at_least(1). is_at_most(255)
      #       region.name << 256
      # expect(region).to be_valid
    end
  end
end
