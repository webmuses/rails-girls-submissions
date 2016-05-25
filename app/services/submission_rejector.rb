class SubmissionRejector
  RULES = [Rules::AgeRule.new, Rules::EnglishRule.new,
    Rules::FirstTimeRule.new, Rules::RorRule.new]

  def initialize(rules = RULES)
    @rules = rules
  end

  def should_reject?(submission)
    should_reject = false

    @rules.each do |rule|
      if rule.broken?(submission)
        should_reject = true
        break
      end
    end

    should_reject
  end

  def reject(submission)
    submission.rejected = true
  end
end
