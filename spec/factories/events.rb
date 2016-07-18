# == Schema Information
#
# Table name: events
#
#  id                        :integer          not null, primary key
#  name                      :string
#  registered_application_id :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

FactoryGirl.define do
  factory :event do
    name "MyString"
    registered_application
  end
end
