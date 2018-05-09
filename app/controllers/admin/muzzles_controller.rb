class Admin::MuzzlesController < Admin::Base

	def index
		@users = User.all.page(params[:page]).per(5).reverse_order
	end
end
