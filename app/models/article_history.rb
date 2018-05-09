class ArticleHistory < ApplicationRecord
	belongs_to :article, optional: true
	belongs_to :history, optional: true
end
