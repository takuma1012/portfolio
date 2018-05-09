class Muzzle::InterviewsController < Muzzle::Base
	before_action :authenticate_user!

  def index
  	@interviews = Interview.all.page(params[:page]).per(5).reverse_order
  end
end
