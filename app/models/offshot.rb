class Offshot < ApplicationRecord
	belongs_to :admin
	attachment :offshot_image
end
