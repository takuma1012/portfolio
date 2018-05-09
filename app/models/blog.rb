class Blog < ApplicationRecord
	belongs_to :admin

	validates :admin_id, presence: true
	validates :title, presence: true
	validates :body, presence: true
end
