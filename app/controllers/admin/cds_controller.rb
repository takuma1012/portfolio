class Admin::CdsController < Admin::Base
  def index
    @cds = Article.where("(type = ?) OR (type = ?)", "Single", "Album").page(params[:page]).per(5).reverse_order
    @track = Track.all
  end

  def new
    @cd = Article.new
    @cd.tracks.build
  end

  def create
    @cd = Article.new(cd_params)
    if @cd.save
      redirect_to admin_cds_path
    else
      render :new
    end
  end

  def edit
    @cd = Article.find(params[:id])
  end

  def update
    Article.find(params[:id]).update(cd_params)
    redirect_to admin_cds_path
  end

  def destroy
    @cd = Article.find(params[:id])
    @cd.destroy
    redirect_to admin_cds_path
  end

  private
  def cd_params
    params.require(:article).permit(:article_name, :type, :price, :stock, :release_date, :article_image,
                                    :tracks_attributes => [:id, :article_id, :lyricer, :composer, :track_num, :track_name, :_destroy])
  end
end
