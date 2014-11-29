class RemovePostionId < ActiveRecord::Migration
  def change
    remove_reference :applications, :postion
  end
end
