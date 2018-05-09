class Muzzle::BlogsController < Muzzle::Base
	before_action :authenticate_user!

  def index
  	unless params[:id].blank?
  		session[:admin_id] = Admin.find(params[:id])

	  	if session[:admin_id].id == 1
	  		@blog = Blog.where(admin_id: 1).page(params[:page]).per(3).reverse_order
	  	elsif session[:admin_id].id == 2
	  		@blog = Blog.where(admin_id: 2).page(params[:page]).per(3).reverse_order
	  	else
		  	@blog = Blog.all.page(params[:page]).per(3).reverse_order
	  	end
	  else
	  	@blog = Blog.all.page(params[:page]).per(3).reverse_order
  	end
  end
end
