class UserMailer < ApplicationMailer
  default from: ENV['MAILER_USERNAME'] || 'test@email.com'

  def report_email(report_type, other_input, url, prof_id, review_id)
    @report_type = report_type
    @other_input = other_input
    @url = url
    @prof_id = prof_id
    @review_id = review_id
    mail(
      to: ENV['MAILER_USERNAME'] || 'test@email.com', subject: 'Review Reported'
    )
  end
end
