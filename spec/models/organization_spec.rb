require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { build(:organization) }

  describe "validations" do
    it "is invalid without an email" do
      expect(organization).to be_invalid
    end
  end
end
