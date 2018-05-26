class Lyric < ApplicationRecord
	belongs_to :admin
	belongs_to :article
	belongs_to :track

	validates :article_id, 	presence: true
	validates :track_id, 	presence: true
	validates :admin_id, 	presence: true
	validates :lyric, 		presence: true
end
