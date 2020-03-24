class UserMailer < ApplicationMailer
  default from: ENV['MAILER_USERNAME']

  def report_email(reportType, otherInput, url, profId, reviewId)
    @reportType = reportType
    @otherInput = otherInput
    @url = url
    @profId = profId
    @reviewId = reviewId
    mail(to: ENV['MAILER_USERNAME'], subject: 'Review Reported')
  end
end
