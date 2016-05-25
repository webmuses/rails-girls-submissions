class Rules::AgeRule
  def broken?(submission)
    if submission.age < 18
      true
    end
  end
end
