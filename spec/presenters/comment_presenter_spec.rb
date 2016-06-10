require 'rails_helper'

RSpec.describe CommentPresenter do
  let!(:comment) { FactoryGirl.create(:comment) }
  subject { described_class.new(comment, comment.user) }

  it "presents comment's user nickname" do
    expect(subject.user_nickname).to eq(comment.user.nickname)
  end

  it "presents comment's timestamp" do
    expect(subject.timestamp).to eq(comment.created_at)
  end

  it "presents comment's user nickname" do
    expect(subject.body).to eq(comment.body)
  end
end
