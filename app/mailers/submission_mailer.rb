class SubmissionMailer < ActionMailer::Base
  default from: "railsgirlskrakow@gmail.com"

  def accepted_email(submission)
    prepare_email(submission)
  end

  def rejected_email(submission)
    prepare_email(submission)
  end

  def waitlist_email(submission)
    prepare_email(submission)
  end

  private

  def prepare_email(submission)
    @name = submission.full_name
    mail(to: submission.email, subject: 'RailsGirls results')
  end
end
