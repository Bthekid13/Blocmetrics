# == Schema Information
#
# Table name: registered_applications
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

FactoryGirl.define do
  factory :registered_application do
    name "MyString"
    user nil
  end
end
