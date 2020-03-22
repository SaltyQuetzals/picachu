
class UserMailer < ApplicationMailer
 
  default from: 'picachu.csce431@gmail.com'

  def report_email(review, reviewid)
  	@review = review
  	@reviewid = reviewid
    mail(to: 'deshantar99@tamu.edu,gracefan@tamu.edu,gwbritain@tamu.edu,lalu@tamu.edu,minsibo0420@tamu.edu,sahilpalnitkar@tamu.edu', subject: "Review Report")
  end
end

