class CsvController < ApplicationController

  def download_accepted
    submissions_accepted = Submission.select { |submission| submission.accepted? }

    respond_to do |format|
      format.csv do
        submissions_accepted_csv = CsvGenerator.new.to_csv(submissions_accepted)
        send_data submissions_accepted_csv
      end
    end
  end

  def download_waitlist
    submissions_waitlist = Submission.select { |submission| submission.waitlist? }

    respond_to do |format|
      format.csv do
        submissions_waitlist_csv = CsvGenerator.new.to_csv(submissions_waitlist)
        send_data submissions_waitlist_csv
      end
    end
  end

  def download_unaccepted
    submissions_unaccepted = Submission.select { |submission| submission.unaccepted? }

    respond_to do |format|
      format.csv do
        submissions_unaccepted_csv = CsvGenerator.new.to_csv(submissions_unaccepted)
        send_data submissions_unaccepted_csv
      end
    end
  end
end
