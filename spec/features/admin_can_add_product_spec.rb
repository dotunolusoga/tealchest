require "rails_helper"
require "spec_helper"

RSpec.feature "Admin can add product" do
  user = Fabricate(:user)
  user = User.new(admin: true)

  before :each do
    visit root_path
    login_as user, scope: :user
  end

  scenario "test adding products" do

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
  end


end
