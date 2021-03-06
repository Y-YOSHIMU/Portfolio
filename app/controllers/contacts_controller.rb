class ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ContactMailer.send_mail(@contact).deliver
			redirect_to root_path
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end
