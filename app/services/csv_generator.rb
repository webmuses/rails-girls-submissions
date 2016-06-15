class CsvGenerator
  def to_csv(submissions)
    column_names = Submission.column_names
    CSV.generate do |csv|
      csv << column_names
      submissions.each do |submission|
        csv << submission.attributes.values_at(*column_names)
      end
    end
  end
end
