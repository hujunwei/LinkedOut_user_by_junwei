class AddItemToReimbursements < ActiveRecord::Migration
  def change
    add_column :reimbursements, :item, :string
  end
end
