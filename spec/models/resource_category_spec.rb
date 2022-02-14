require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) { build(:resource_category) }

  describe "validations" do 
    it "is invalid without a name" do 
      expect(resource_category).to be_valid
    end
    it "cannot have a name length greater than 255" do
      expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end
    it "is a unique name" do
      expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
    end
  end

  describe "associations" do
    it "has many tickets" do 
      expect(resource_category).to have_many(:tickets)
    end
    it "has and belongs to many organizations" do
      expect(resource_category).to have_and_belong_to_many(:organizations)
    end
  end

  describe "scope" do
    it "has a scope" do
      resource_category = ResourceCategory.new
      expect(resource_category).to respond_to(:active || :inactive)
    end
  end

  describe "methods" do
    describe "::unspecified" do
      it "returns a resource category with the name 'Unspecified'" do
        resource_category = ResourceCategory.unspecified
        expect(resource_category.name).to eq('Unspecified')
      end
    end
    describe "#activate" do
      it "makes a region category active" do
        resource_category.active = false
        resource_category.activate
        expect(resource_category.active).to be_truthy
      end
    end
    describe "#deactivate" do 
      it "makes a region category unactive" do 
        resource_category.activate
        expect(resource_category.active).to be_truthy
      end
    end
    describe "#inactive?" do 
      it "is false when it is inactive" do 
        resource_category.active = false
        expect(resource_category.inactive?).to be_truthy
      end
      it "is true when it is inactive" do 
        resource_category.active = false
        expect(resource_category.inactive?).to be_truthy
      end
    end
    describe "#to_s" do
      it "has a string representation that is its name" do 
        name = resource_category.name
        expect(resource_category.to_s).to eq(name)
      end
    end
  end
end