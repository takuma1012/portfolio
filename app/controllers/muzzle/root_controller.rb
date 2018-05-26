class Muzzle::RootController < Muzzle::Base
  def top
  	@main = MainPage.first
  	@article = Article.find_by(id: 5)
  end
end
