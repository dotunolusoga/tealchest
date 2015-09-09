require "rails_helper"

RSpec.feature "Visitor can browse inventory" do

  scenario "test products page" do
    visit "/"

    expect(page).to have_content "Product 1"
    expect(page).to have_content "Product 2"
  end

end
