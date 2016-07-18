require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  ## Associations
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:events) }
  end

  ## Attributes
  describe "attributes" do
    it {should have_db_column(:name).of_type(:string) }
    it {should have_db_column(:url).of_type(:string) }
  end

  ## Validations
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
