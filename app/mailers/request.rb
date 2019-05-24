class Request < ApplicationMailer
  def notify(attrs)
    @message = attrs['message']
    mail(
      from: "<#{attrs['email']}>",
      to: '<contact@naprok.com>',
      subject: "Contact Us Form Submission"
    )
  end
end
