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

class Event < ActiveRecord::Base
  belongs_to :registered_application

  #Validations
  validates :name, presence: true

end
