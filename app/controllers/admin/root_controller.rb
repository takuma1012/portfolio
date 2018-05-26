class Admin::RootController < Admin::Base
  def top
    @main = MainPage.first
    # @news = Topic.new
    # @main = MainPage.new

  	now = Time.current
  	unless History.where(created_at: 2.day.ago..now).blank?
  		@newhist = History.where(created_at: 2.day.ago..now)
  	end

  	unless Contact.where(created_at: 2.day.ago..now).blank?
  		@newmail = Contact.where(created_at: 2.day.ago..now)
  	end
  end

  def create
    # @news = Topic.new(news_params)
    @main = MainPage.new(main_params).save
    redirect_to admin_root_path
  end

  def update
    @main = MainPage.first
    if @main.update(main_params)
      redirect_to admin_root_path, notice: 'TOP画像を更新しました'
    else
      render admin_root_path
    end
  end

  private
  def main_params
    params.require(:main_page).permit(:main_image)
  end

  def news_params
    params.require(:topic).permit(:notice)
  end
end
