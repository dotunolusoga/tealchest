require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price_cents) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:amount_available) }

    it { should validate_numericality_of(:price_cents) }
    it { should validate_numericality_of(:amount_available) }
    # it { should validate_presence_of(:image) }

    it "should have a working factory" do
      Fabricate.build(:product).should be_valid
    end
  end
end
