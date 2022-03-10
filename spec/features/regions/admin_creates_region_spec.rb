require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

  describe "creating a region" do

    scenario "admin creates a region successfully" do
      admin = create(:user, :admin)
      admin.confirm
      log_in_as(admin)
      visit "/dashboard"
      click_on "Regions"
      click_on "Add Region"
      fill_in "Name", with: "Fake Region"
      click_on "Add Region"
      expect(page).to have_text "Region successfully created."
    end
  end

end
