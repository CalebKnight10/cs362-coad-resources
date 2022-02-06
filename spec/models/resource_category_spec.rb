require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) { build(:resource_category) }

  describe "validations" do 
    it "is invalid without a name" do 
      expect(resource_category).to be_valid
    end
    it "is invalid with a name greater than 255 char" do
      expect(resource_category).to be_valid
    end
  end


  describe "associations" do
    it "has many tickets" do 
      expect(resource_category).to have_many(:tickets)
    end
  end

  
  describe "methods" do
    describe "unspecified" do
      it "returns a resource category with the name 'Unspecified'" do
        resource_category = build(:resource_category, name: 'Unspecified')
        expect(resource_category.name).to eq('Unspecified')
      end
    end
    describe "activate" do
      it "makes a region category active" do
        expect(resource_category.activate).to be_truthy
      end
    end
    describe "deactivate" do 
      it "makes a region category unactive" do 
        expect(resource_category.deactivate).to be_truthy
      end
    end
    describe "inactive" do 
      it "is an inactive resource category" do 
        resource_category.active = true
        expect(resource_category.inactive?).to eq(false)
      end
    end
    describe "to_s" do
      it "has a string representation that is its name" do 
        name = resource_category.name
        expect(resource_category.to_s).to eq(name)
      end
    end
  end
end