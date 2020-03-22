class UserMailer < ApplicationMailer
  default from: 'picachu.csce431@gmail.com'

  def report_email(review, reviewid)
    @review = review
    @reviewid = reviewid
    mail(to: 'lalu@tamu.edu', subject: 'Review Report')
  end
end
