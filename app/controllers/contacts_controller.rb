class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      flash[:success] = "We have received your information and will get back to you shortly"
      redirect_to :root
    else
      session[:error] = @contact.errors.full_messages
      render "new"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
