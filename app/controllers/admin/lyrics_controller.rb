class Admin::LyricsController < Admin::Base
	def index
	end

	def new
		@lyric = Lyric.new
		@articles = Article.where.not(type: "Goods")
		@tracks = Track.all
		@admins = Admin.all
	end

	def get_tracks
		render partial: 'layouts/admin/select_track', locals: {article_id: params[:article_id]}
	end

	def create
		@lyrics = Lyric.new(lyric_params)
		if @lyrics.save
			redirect_to admin_lyrics_path, notice: "歌詞を追加しました"
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def lyric_params
		params.require(:lyric).permit(:article_id, :track_id, :admin_id, :lyric)
	end
end
