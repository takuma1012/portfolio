class Muzzle::OffshotsController < Muzzle::Base
	before_action :authenticate_user!

  def index
  	@offshot = Offshot.all
  end
end
