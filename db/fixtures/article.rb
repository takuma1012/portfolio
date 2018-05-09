Article.seed do |s|
	s.id			= 1
	s.article_name 	= "絶望ノ朝"
	s.price			= 1200
	s.stock			= 1000
	s.release_date	= "2015/04/29"
	s.type			= "Single"
	s.article_image	= Rails.root.join("db/fixtures/images/zetsubou.jpg").open
end

Article.seed do |s|
	s.id			= 2
	s.article_name 	= "Liar..."
	s.price			= 1728
	s.stock			= 100
	s.release_date	= "2016/09/28"
	s.type			= "Single"
	s.article_image	= Rails.root.join("db/fixtures/images/liar.jpg").open
end

Article.seed do |s|
	s.id			= 3
	s.article_name 	= "混沌ノ匣"
	s.price			= 3564
	s.stock			= 10
	s.release_date	= "2016/05/11"
	s.type			= "Album"
	s.article_image	= Rails.root.join("db/fixtures/images/konton.jpg").open
end

Article.seed do |s|
	s.id			= 4
	s.article_name 	= "妄想主義者ノ背徳"
	s.price			= 2700
	s.stock			= 50
	s.release_date	= "2015/07/01"
	s.type			= "Album"
	s.article_image	= Rails.root.join("db/fixtures/images/mousou.jpg").open
end

Article.seed do |s|
	s.id			= 5
	s.article_name 	= "Fake"
	s.price			= 1200
	s.stock			= 1000
	s.release_date	= "2015/04/29"
	s.type			= "Single"
	s.article_image	= Rails.root.join("db/fixtures/images/fake.jpg").open
end

Article.seed do |s|
	s.id			= 6
	s.article_name 	= "シュシュ"
	s.price			= 500
	s.stock			= 200
	s.release_date	= "2016/02/20"
	s.type			= "Goods"
end

Article.seed do |s|
	s.id			= 7
	s.article_name 	= "チェキファイル"
	s.price			= 1000
	s.stock			= 500
	s.release_date	= "2016/02/20"
	s.type			= "Goods"
end