class ChangePostionToPosition < ActiveRecord::Migration
  def change
    remove_reference :applications, :postion_id
    add_reference :applications, :position
  end
end
