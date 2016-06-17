class CsvController < ApplicationController

  def download_accepted
    submissions_accepted = SubmissionRepository.new.accepted

    submissions_accepted_csv = CsvGenerator.new.to_csv(submissions_accepted)
    send_data submissions_accepted_csv, filename: 'accepted.csv', type: "text/csv"
  end

  def download_waitlist
    submissions_waitlist = SubmissionRepository.new.waitlist
    csv = CsvGenerator.new.call(submissions_waitlist, 'waitlist.csv')
    
    send_data csv.file, csv.properties
  end

  def download_unaccepted
    submissions_unaccepted = SubmissionRepository.new.unaccepted

    submissions_unaccepted_csv = CsvGenerator.new.to_csv(submissions_unaccepted)
    send_data submissions_unaccepted_csv, filename: 'unaccepted.csv', type: "text/csv"
  end
end
