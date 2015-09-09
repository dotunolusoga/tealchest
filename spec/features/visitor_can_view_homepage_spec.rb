require "rails_helper"

RSpec.feature "Visitor can see homepage" do

  scenario "test homepage title" do
    visit '/'
    expect(page.title).to match "Tealchest"
  end

end
