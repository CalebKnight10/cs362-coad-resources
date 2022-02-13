require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { build(:region) }

  describe "validations" do
    it "has a name" do
      expect(region).to respond_to(:name)
    end

    it "is a unique name" do
      expect(region).to validate_uniqueness_of(:name).case_insensitive
    end

    it "cannot have a name length greater than 255" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
  end

  describe "methods" do
    describe "#to_s" do
      it "has a string representation that is its name" do 
        name = region.name
        expect(region.to_s).to eq(name)
      end
    end

    describe "::unspecified" do
      it "returns a Region with the name 'Unspecified'" do
        region = Region.unspecified
        expect(region.name).to eq('Unspecified')
      end
    end
  end

  describe "associations" do
    it "has many tickets" do
      expect(region).to have_many(:tickets)
    end
  end
end
