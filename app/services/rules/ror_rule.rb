class Rules::RorRule
  def broken?(submission)
    submission.ror == 'fluent'
  end
end
