class CommentCreator
  def self.build(body, submission_id, user_id)
    submission = Submission.find(submission_id)
    user = User.find(user_id)
    new(body, submission, user)
  end

  def initialize(body, submission, user)
    @body = body
    @submission = submission
    @user = user
  end

  def call
    comment = Comment.new({ body: @body, submission: @submission, user: @user })
    @success = comment.save

    comment
  end

  def success?
    @success
  end
end
