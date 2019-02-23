require 'rails_helper'

RSpec.feature "homepage" do
  scenario "when visiting root" do
    visit "/"

    expect(page).to have_link("Home")
    expect(page).to have_link("Athletes Den")
    expect(page).to have_content("Work it Out!")
    expect(page).to have_content("An RoR web app featuring Action Cable")
  end
end
