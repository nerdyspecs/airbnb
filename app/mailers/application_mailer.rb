class ApplicationMailer < ActionMailer::Base
	default from: "airbnb@mail.com"
  	layout 'mailer'
end
