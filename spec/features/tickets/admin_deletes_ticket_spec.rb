require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  describe "successfully deletes a ticket" do 
    scenario "Admin successfully deletes a Ticket" do 
      admin = create(:admin_user)
      admin.confirm 
      log_in_as(admin)
      ticket = create(:ticket)
      visit "/tickets/#{ticket.id}"
      expect(page).to have_text "#{ticket.name}"
      click on 'Delete'
      expect(page).to have_text "Ticket #{ticket.id} was deleted."
    end
  end
end
