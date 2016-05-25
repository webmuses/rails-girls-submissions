class Rules::EnglishRule
  def broken?(submission)
    submission.english == "none" ? true : false
  end
end
