class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.date :post_date
      t.date :deadline
      t.string :name
      t.text :description
      t.string :location
      t.string :pos_type
      t.string :level
      t.string :position_status
      t.timestamps
    end
    add_reference :positions, :user, index: true
  end
end
