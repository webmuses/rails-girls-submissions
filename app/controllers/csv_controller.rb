class CsvController < ApplicationController

  def download_accepted
    submissions_accepted = Submission.select { |submission| submission.accepted? }

    submissions_accepted_csv = CsvGenerator.new.to_csv(submissions_accepted)
    send_data submissions_accepted_csv, filename: 'accepted.csv', type: "text/csv"
  end

  def download_waitlist
    submissions_waitlist = Submission.select { |submission| submission.waitlist? }

    submissions_waitlist_csv = CsvGenerator.new.to_csv(submissions_waitlist)
    send_data submissions_waitlist_csv, filename: 'waitlist.csv', type: "text/csv"
  end

  def download_unaccepted
    submissions_unaccepted = Submission.select { |submission| submission.unaccepted? }

    submissions_unaccepted_csv = CsvGenerator.new.to_csv(submissions_unaccepted)
    send_data submissions_unaccepted_csv, filename: 'unaccepted.csv', type: "text/csv"
  end
end
