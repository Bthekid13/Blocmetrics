# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  ## Associations

  describe "associations" do
    it { should have_many(:registered_applications) }
  end

  ## Attributes

  describe "attributes" do
    it {should have_db_column(:first_name).of_type(:string) }
    it {should have_db_column(:last_name).of_type(:string) }
    it {should have_db_column(:encrypted_password).of_type(:string) }
    it {should have_db_column(:email).of_type(:string) }
  end

end
