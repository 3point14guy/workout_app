require 'rails_helper'

RSpec.feature "Listing Members" do
  before do
    @user1 = User.create(first_name: "John",
                        last_name: "Mama",
                        email: "joe@mail.com",
                        password: "password1")
    @user2 = User.create(first_name: "Jane",
                        last_name: "JaMama",
                        email: "jane@mail.com",
                        password: "password1")

  end

  scenario "displays a list of registered users" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@user1.full_name)
    expect(page).to have_content(@user2.full_name)
  end
end
