class CreateReimbursements < ActiveRecord::Migration
  def change
    create_table :reimbursements do |t|
      t.integer :pid
      t.integer :ca_id
      t.float :money
      t.string :reimburse_status

      t.timestamps
    end
  end
end
