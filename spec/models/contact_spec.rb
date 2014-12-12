require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:contact)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:contact, name: nil)).to be_invalid
  end
end
