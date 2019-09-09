class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
    ## Omission
  
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        ContactMailer.contact_mail(@contact).deliver  ##Postscript
        redirect_to contact_path, notice: 'Contact was successfully created.'
      else
        render :new
      end
    end
  
    ## Omission
  
    private
  
    def set_contact
    @contact = Contact.find(params[:id])
    end
  
    def contact_params
    params.require(:contact).permit(:name, :email, :content)
    end
  end