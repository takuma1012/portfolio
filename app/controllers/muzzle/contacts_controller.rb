class Muzzle::ContactsController < Muzzle::Base
  before_action :authenticate_user!

  def new
  	@contacts = Contact.new
  end

  def create
  	@contacts = Contact.new(mail_params)

    if @contacts.save
  	 redirect_to muzzle_contacts_sent_path
    else
      render :new
    end
  end

  def sent
  end
end

private
def mail_params
	params.require(:contact).permit(:name, :title, :body)
end