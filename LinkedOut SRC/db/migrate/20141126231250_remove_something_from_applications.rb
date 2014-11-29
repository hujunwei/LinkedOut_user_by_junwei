class RemoveSomethingFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :ca_id, :integer
    remove_column :applications, :pid, :integer
  end
end
