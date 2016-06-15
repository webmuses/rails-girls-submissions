class CsvGenerator
  def to_csv(submissions)
    column_names = ["full_name", "email"]
    CSV.generate do |csv|
      csv << column_names
      submissions.each do |submission|
        csv << submission.attributes.values_at(*column_names)
      end
    end
  end
end
