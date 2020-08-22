# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

	def contact
		contact = contact.new(name: "test", message: "testmessage")
		ContactMailer.send_mail(contact)
	end
end
