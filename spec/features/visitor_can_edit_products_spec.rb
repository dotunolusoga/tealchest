require "rails_helper"
require "spec_helper"

RSpec.feature "Visitor can edit product" do

  scenario "test editing products" do
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
    page.should have_css("td", text: "Lace")

    click_on "Edit"
    expect(page).to have_content "Edit Product"
    fill_in "Name", with: "Guipere"
    fill_in "Description", with: "Purple Expensive Lace"
    current_path.should == edit_product_path

    click_on "Update"
    expect(page).to have_content "Products List"
    expect(page).to have_content "Name"
    expect(page).to have_content "Description"

    current_path.should == products_path


  end

  scenario "sad path" do
    visit root_path

    click_on "Fabric"
    expect(page).to have_content "Products List"
    expect(page).to have_content "Name"
    expect(page).to have_content "Description"

    current_path.should == products_path
  end

end
