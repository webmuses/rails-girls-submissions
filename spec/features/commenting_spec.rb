describe "the commenting process" do
  let!(:submission) { FactoryGirl.create(:submission) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:comment_body) { 'lalala' }

  it "visits submission page, creates comment" do
    login_as(user, scope: :user)
    visit submission_path(submission)
    fill_in 'comment_body', with: comment_body
    expect{click_button 'Comment'}.to change(submission.comments, :count).by(1)
    expect(page).to have_text(comment_body)
  end
end
