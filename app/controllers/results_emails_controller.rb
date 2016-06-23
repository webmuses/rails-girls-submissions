class ResultsEmailsController < ApplicationController
  def send_emails
    submissions_accepted = SubmissionRepository.new.accepted
    submissions_accepted.each do |submission|
      SubmissionMailer.accepted_email(submission).deliver_now
    end
    redirect_to :back
  end
end
