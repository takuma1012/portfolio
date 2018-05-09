class Muzzle::UsersController < Muzzle::Base
	before_action :authenticate_user!

end
