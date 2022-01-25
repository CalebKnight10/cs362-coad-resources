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

  describe "uniqueness" do 
    it "is not case senstive" do
      name = 'Fake Name'
      region = Region.create(name: name)
      region_two = Region.new(name: 'Unique Name')
      expect(region).to be_valid
      region_two = region.dup
      expect(region_two).to be_invalid
      region_two.name = name.downcase
      expect(region_two).to be_invalid
    end
  end

end
