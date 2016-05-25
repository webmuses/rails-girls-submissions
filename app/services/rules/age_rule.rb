class Rules::AgeRule
  def broken?(submission)
    submission.age < 18 ? true : false
  end
end
