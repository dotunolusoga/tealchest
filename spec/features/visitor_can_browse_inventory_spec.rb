require "rails_helper"

RSpec.feature "Visitor can browse inventory" do

  scenario "test products page" do
    Product.create!(name: "Product 1")
    Product.create!(name: "Product 2")

    visit "/"

    expect(page).to have_content "Product 1"
    expect(page).to have_content "Product 2"
  end

end
