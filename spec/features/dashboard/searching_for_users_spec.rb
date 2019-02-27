require 'rails_helper'
require 'support/attributes'

RSpec.feature "Searching for Users" do
  before do
    @joe = User.create!(user1_attributes)
    @jan = User.create!(user2_attributes(last_name: "Mama"))
  end

  scenario "returns the correct users" do
    visit "/"

    fill_in "search_name", with: "Mama"
    click_button "Search"

    expect(page).to have_content(@joe.full_name)
    expect(page).to have_content(@jan.full_name)
    expect(current_path).to eq("/dashboards/search")
  end
end
