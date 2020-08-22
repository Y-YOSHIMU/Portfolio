class ContactMailer < ApplicationMailer

	def send_mail(contact)
		@contact = contact
		mail(
			from: 'from@example.com',
			to:   'mcu7.oldtr.uc@gmail.com',
			subject: 'お問い合わせ通知'
			)
	end
end
