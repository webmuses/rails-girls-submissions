class Rules::FirstTimeRule
  def broken?(submission)
    !submission.first_time
  end
end
