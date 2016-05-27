class Rules::EnglishRule
  def broken?(submission)
    submission.english == "none"
  end
end
