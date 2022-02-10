class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      # flash.now[:notice] = 'Message sent!'
      redirect_to portfolio_display_path, notice: 'Message sent!'
    else
      # flash.now[:alert] = 'Could not send message'
      render :new, status: :unprocessable_entity
      # render 'portfolio/display', status: :unprocessable_entity
    end
  end
end
