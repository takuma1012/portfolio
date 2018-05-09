class Admin::RootController < Admin::Base
  def top
    @main = MainPage.find_by(id: 2)
    @news = Topic.new

  	now = Time.current
  	# binding.pry
  	unless History.where(created_at: 2.day.ago..now).blank?
  		@newhist = History.where(created_at: 2.day.ago..now)
  	end

  	unless Contact.where(created_at: 2.day.ago..now).blank?
  		@newmail = Contact.where(created_at: 2.day.ago..now)
  	end
  end

  def create
    @news = Topic.new(news_params)
    @main.save
  end

  def update
    @main = MainPage.find_by(id: 2)
    if @main.update(main_params)
      redirect_to admin_root_path, notice: 'TOP画像を更新しました'
    else
      render :top
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
