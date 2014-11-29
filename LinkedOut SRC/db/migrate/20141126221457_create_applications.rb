class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :pid
      t.integer :ca_id
      t.string :application_status
      t.datetime :update_date

      t.timestamps
    end
  end
end
