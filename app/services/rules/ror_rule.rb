class Rules::RorRule
  def broken?(submission)
    submission.ror == 'fluent' ? true : false
  end
end
