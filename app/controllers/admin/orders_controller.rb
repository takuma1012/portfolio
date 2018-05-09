class Admin::OrdersController < Admin::Base
  def index
  	@orders = History.all.page(params[:page]).per(5).reverse_order
  end

  def update
  	@history = History.find(params[:id]).update(hist_params)
    redirect_to admin_orders_path
  end


  private
  def hist_params
  	params.require(:history).permit(:pay_status, :status)
  end
end
