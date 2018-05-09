class Admin::InterviewsController < Admin::Base
  def index
    @interviews = Interview.all.page(params[:page]).per(5).reverse_order
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(int_params)
    @interview.admin_id = 1
    user = User.where(mail_flg: false)
    if @interview.save
      user.each do |user|
        InformationMailer.news(user).deliver!
      end
      redirect_to admin_interviews_path
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    Interview.find(params[:id]).update(int_params)
    redirect_to admin_interviews_path
  end

  def destroy
    @int = Interview.find(params[:id])
    @int.destroy
    redirect_to admin_interviews_path
  end


  private
  def int_params
    params.require(:interview).permit(:title, :body, :admin_id)
  end
end
