class Rules::EnglishRule
  def broken?(submission)
    if submission.english == "none"
      true
    end
  end
end
