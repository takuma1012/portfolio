class Admin::OffshotsController < Admin::Base
  def index
  	@off = Offshot.new
  	@offshots = Offshot.all.page(params[:page]).per(5).reverse_order
  end

  def create
  	Offshot.new(off_params).save
  	redirect_to admin_offshots_path
  end

  def update
  end

  def destroy
  	@off = Offshot.find(params[:id])
  	@off.destroy
  	redirect_to admin_offshots_path
  end

  private
  def off_params
  	params.require(:offshot).permit(:offshot_image, :admin_id)
  end
end
