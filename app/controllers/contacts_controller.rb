# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    begin
      if @contact.deliver
        redirect_to home_path, notice: 'Message sent!'
      else
        flash.alert = 'Invalid form'
        render :new, status: :unprocessable_entity
      end
    rescue Net::SMTPFatalError
      flash.alert = 'Mail Server Error: try again later'
      render :new, status: :unprocessable_entity
    rescue RuntimeError => e
      flash.alert = "Unexpected Error : #{e} "
      render :new, status: :unprocessable_entity
    end
  end
end
