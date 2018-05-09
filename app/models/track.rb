class Track < ApplicationRecord
	belongs_to :article

	validates :track_name, presence: true
	validates :track_num, presence: true
	validates :composer, presence: true
end
