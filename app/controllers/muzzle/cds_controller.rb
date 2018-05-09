class Muzzle::CdsController < Muzzle::Base
  def index
  	@single = Article.where(:type => "Single")
  	@album = Article.where(:type => "Album")
  	@goods = Article.where(:type => "Goods")
  end
end
