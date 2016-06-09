class CommentPresenter
  def initialize(comment, user)
    @comment = comment
    @user = user
  end

  def print_body
    @comment.body
  end

  def print_user
    @user.nickname
  end

  def print_timestamp
    @comment.updated_at
  end
end
