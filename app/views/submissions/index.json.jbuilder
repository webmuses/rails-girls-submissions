json.array!(@submissions) do |submission|
  json.extract! submission, :id, :full_name, :email, :age, :codeacademy_username, :description, :experience, :english, :operating_system, :first_time, :goals, :problems
  json.url submission_url(submission, format: :json)
end
