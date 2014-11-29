class AddIsCandidateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isCandidate, :bool
  end
end
