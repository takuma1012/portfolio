class Article < ApplicationRecord
	has_many :tracks, dependent: :destroy, inverse_of: :article
	has_many :article_histories, dependent: :destroy
	has_many :histories, through: :article_histories

	accepts_nested_attributes_for :tracks, allow_destroy: true

	attachment :article_image

	###STI(Single Table Inheritance)という１つのテーブルを複数で利用する使用する仕組みとして###
	###"type"という名前をActiveRecordが利用するため、カラム名をrenameしない場合は以下を追記###
	self.inheritance_column = :_type_disabled

	validates :article_name, presence: true
	validates :type, presence: true
	validates :stock, presence: true
	validates :release_date, presence: true
	validates :price, presence: true
end
