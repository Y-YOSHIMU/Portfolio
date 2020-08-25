class ContactMailer < ApplicationMailer

	def send_mail(contact)
		@contact = contact
		mail(
			from: 'from@example.com',
			to:   ENV['gmail_address'],
			subject: 'お問い合わせ通知'
			)
	end
end
