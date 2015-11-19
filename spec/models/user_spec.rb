require 'spec_helper'

describe User do
  it { should validate_presence_of (:name) }
  it { should validate_presence_of (:address) }
  it { should validate_presence_of (:city) }
  it { should validate_presence_of (:country) }
  it { should validate_presence_of (:postal_code) }

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end
end

describe User, '#admin?' do
  user = Fabricate(:user)

  it 'returns true when privileges include :admin' do
    user = User.new(admin: true)
    expect(user.admin?).to be true
  end
end
