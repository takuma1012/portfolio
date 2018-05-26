class Muzzle::AdminsController < Muzzle::Base
  def index
  	@admins = Admin.all
  end
end
