require 'rails_helper'

RSpec.describe Event, type: :model do

  ## Associations

  describe "associations" do
    it { should belong_to(:registered_application) }
  end

  ## Attributes

  describe "attributes" do
    it {should have_db_column(:name).of_type(:string) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end


end
