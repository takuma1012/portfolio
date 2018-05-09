class Muzzle::ItemsController < Muzzle::Base
  def index
  	@item = Item.all
  end
end
