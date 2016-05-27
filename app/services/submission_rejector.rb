class SubmissionRejector
  RULES = [Rules::AgeRule.new, Rules::EnglishRule.new,
    Rules::FirstTimeRule.new, Rules::RorRule.new]

  def initialize(rules = RULES)
    @rules = rules
  end

  def reject_if_needed(submission)
    if should_reject?(submission)
      reject(submission)
    end
  end

  def should_reject?(submission)
    @rules.any? { |rule| rule.broken?(submission) }
  end

  def reject(submission)
    submission.rejected = true
  end
end
