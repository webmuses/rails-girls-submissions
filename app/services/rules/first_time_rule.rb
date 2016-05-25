class Rules::FirstTimeRule
  def broken?(submission)
    submission.first_time ? false : true
  end
end
