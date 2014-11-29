class AddReferencesToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :user, index: true
    add_reference :applications, :postion, index: true
  end
end
