require "rails_helper"
require "spec_helper"

RSpec.feature "Visitor can browse inventory" do

  scenario "test products page" do
    visit root_path

    click_on "Products"
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
