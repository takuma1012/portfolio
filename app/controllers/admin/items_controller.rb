class Admin::ItemsController < Admin::Base
  def index
    @items = Article.where(type: "Goods").page(params[:page]).per(5).reverse_order
  end

  def new
    @item = Article.new
  end

  def create
    @item = Article.new(item_params)
    @item.type = "Goods"
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def edit
    @item = Article.find(params[:id])
  end

  def update
    Article.find(params[:id]).update(item_params)
    redirect_to admin_items_path
  end

  def destroy
    @item = Article.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:article).permit(:article_name, :type, :release_date, :price, :stock, :article_image)
  end
end
