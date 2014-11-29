class ChangeApplicationsUpdateDate < ActiveRecord::Migration
  def change
  	change_column :applications, :update_date, :datetime
  end
end
