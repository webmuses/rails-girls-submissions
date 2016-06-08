require 'rails_helper'

RSpec.describe CommentCreator do
  let!(:submission) { FactoryGirl.create(:submission) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:comment_body) { "comment" }
  subject { described_class.build(comment_body, submission, user) }

  it "creates a new comment" do
    subject.call
    expect(Comment.where(body: "comment", submission_id: submission.id, user_id: user.id).first).not_to be_nil
    expect(subject.success?).to be true
  end
end
