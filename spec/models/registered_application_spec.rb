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

require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
