class SubmissionRejector
  def initialize(rules)
    @rules = rules
  end

  def reject?(submission_id)
    reject = false
    submission = Submission.find(Integer(submission_id))

    @rules.each do |rule|
      if rule.broken?(submission)
        reject = true
        break
      end
    end

    reject
  end
end
