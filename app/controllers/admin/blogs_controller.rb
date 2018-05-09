class Admin::BlogsController < Admin::Base
  def index
    @blogs = Blog.all.page(params[:page]).per(5).reverse_order
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    user = User.where(mail_flg: false)
    if @blog.save
      user.each do |user|
        InformationMailer.news(user).deliver!
      end
      redirect_to admin_blogs_path
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    Blog.find(params[:id]).update(blog_params)
    redirect_to admin_blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :admin_id)
  end
end
