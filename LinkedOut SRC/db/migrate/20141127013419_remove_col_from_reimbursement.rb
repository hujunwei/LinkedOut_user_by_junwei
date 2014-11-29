class RemoveColFromReimbursement < ActiveRecord::Migration
  def change
  	remove_column :reimbursements, :ca_id, :integer
  	remove_column :reimbursements, :pid, :integer
  	add_reference :reimbursements, :user, index: true
  	add_reference :reimbursements, :position, index: true
  end
end
