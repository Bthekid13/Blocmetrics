class AddUrlToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :url, :string
  end
end
