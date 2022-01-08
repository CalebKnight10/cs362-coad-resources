require 'rails_helper'

RSpec.describe Region, type: :model do

  it "exists" do
    Region.new
  end

  it "has a name" do
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    region = Region.new(name: 'Mt. Hood')
    result = region.to_s
    expect(result).to eq('Mt. Hood')
  end

end
