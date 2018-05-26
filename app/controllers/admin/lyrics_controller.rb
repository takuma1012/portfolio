class Admin::LyricsController < Admin::Base
	before_action :lyric_temp, only: [:new, :edit]

	def index
		@lyrics = Lyric.all.page(params[:page]).per(5).reverse_order
	end

	def new
		@lyric = Lyric.new
	end

	def get_tracks
		render partial: 'layouts/admin/select_track', locals: {article_id: params[:article_id]}
	end

	def create
		@lyrics = Lyric.new(lyric_params)
		if @lyrics.save
			redirect_to admin_lyrics_path, notice: "歌詞を追加しました"
		else
			redirect_to new_admin_lyric_path, notice: "作成に失敗しました。再度すべての項目を確認してください。"
		end
	end

	def edit
		@lyric = Lyric.find(params[:id])
	end

	def update
		@lyrics = Lyric.find(params[:id])
		if @lyrics.update(lyric_params)
			redirect_to admin_lyrics_path, notice: "歌詞を編集しました"
		else
			render :edit
		end
	end

	def destroy
		if Lyric.find(params[:id]).destroy
			redirect_to admin_lyrics_path, notice: "歌詞を削除しました"
		end
	end

	private
	def lyric_temp
		@articles = Article.where.not(type: "Goods")
		@tracks = Track.all
		@admins = Admin.all
	end

	def lyric_params
		params.require(:lyric).permit(:article_id, :track_id, :admin_id, :lyric)
	end
end
