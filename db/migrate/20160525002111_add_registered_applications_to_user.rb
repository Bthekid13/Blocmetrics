class AddRegisteredApplicationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :registered_applications_id, :integer
  end
end
