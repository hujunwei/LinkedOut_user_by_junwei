class Position < ActiveRecord::Base
	belongs_to :user
	has_many :applications,  dependent: :destroy
	has_many :reimbursement, dependent: :destroy
end
