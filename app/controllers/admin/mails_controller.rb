class Admin::MailsController < Admin::Base
  def index
  	@mails = Contact.all.page(params[:page]).per(5).reverse_order
  end
end
