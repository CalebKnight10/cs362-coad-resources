require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  describe "deleting a region" do

    scenario "admin deletes a region successfully" do
      admin = create(:user, :admin)
      admin.confirm
      log_in_as(admin)
      visit "/dashboard"
      click_on "Regions"
      click_on "Add Region"
      region_name = "Fake Region"
      fill_in "Name", with: region_name
      click_on "Add Region"
      click_on region_name
      click_on "Delete"
      expect(page).to have_text "Region #{region_name} was deleted."
    end
  end

end
