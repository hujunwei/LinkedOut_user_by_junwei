class Micropost < ActiveRecord::Base
	belongs_to :user
	#defind order as inverse order of time
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true, length: { maximum: 100 }
end
