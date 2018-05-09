class History < ApplicationRecord
	has_many :article_histories
	has_many :articles, through: :article_histories
	has_many :deliveries
	accepts_nested_attributes_for :article_histories

	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :last_name_kana, presence: true
	validates :first_name_kana, presence: true
	validates :postal_code, presence: true
	validates :prefecture, presence: true
	validates :city, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates :price, presence: true
	validates :payment, presence: true
end
