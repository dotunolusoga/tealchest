require "rails_helper"
require "spec_helper"

RSpec.feature "Visitor can edit product" do
  user = Fabricate(:user)
  user = User.new(admin: true)

  before :each do
    visit root_path
    login_as user, scope: :user
  end

  scenario "test editing products" do

    click_on "New Product"
    expect(page).to have_content "Add Product"
    fill_in "Name", with: "Lace"
    fill_in "Description", with: "Beautifiul Yellow Lace"
    fill_in "Price", with: "10"
    fill_in "Color", with: "Yellow"
    fill_in "Quantity", with: "50"

    click_on "Create Product"
    current_path.should == products_path
    page.should have_css("td", text: "Lace")

    first(:link, 'Edit').click
    expect(page).to have_content "Edit Product"
    fill_in "Name", with: "Guipere"
    fill_in "Description", with: "Purple Expensive Lace"

    click_on "Update Product"
    expect(page).to have_content "Products List"
    expect(page).to have_content "Name"
    expect(page).to have_content "Description"
    page.should have_css("td", text: "Guipere")
    page.should have_css("td", text: "Purple Expensive Lace")

    current_path.should == products_path

  end

end
