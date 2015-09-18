require "rails_helper"
require "spec_helper"
RSpec.feature "Visitor can browse inventory" do

  scenario "test products page" do
    visit root_path

    click_on "New Product"
    expect(page).to have_content "Add Product"
    fill_in "Name", with: "Lace"
    fill_in "Description", with: "Beautifiul Yellow Lace"
    fill_in "Price", with: "10"
    fill_in "Color", with: "Yellow"
    fill_in "Quantity", with: "50"

    click_on "Add"
    current_path.should == products_path
    page.should have_css("p", text: "Lace")
  end

  scenario "sad path" do
    visit root_path

    click_on "New Product"
    expect(page).to have_content "Add Product"
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Add"
    expect(page).to have_content("Product could not be saved. Please fix the errors to continue.")
  end

end
