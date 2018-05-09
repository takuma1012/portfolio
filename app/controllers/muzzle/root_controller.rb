class Muzzle::RootController < Muzzle::Base
  def top
  	@main = MainPage.find_by(id: 2)
  	@article = Article.find_by(id: 5)
  end
end
