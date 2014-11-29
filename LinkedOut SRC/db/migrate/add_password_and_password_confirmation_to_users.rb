class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
      add_index :users, :password, :password_confirmation, :string
  end
end
