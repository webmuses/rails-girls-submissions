include Warden::Test::Helpers
Warden.test_mode!
#
# describe "the rating process" do
#   before :each do
#     @submission = FactoryGirl.create(:submission)
#   end
#
#   it "signs me in" do
#     @user = FactoryGirl.create(:user)
#     sign_in @user
#
#     visit submission_path(@submission)
#     click_button '4'
#     #expect(page).to have_content 'Success'
#   end
# end


describe "the rating process" do
  before :each do
    @submission = FactoryGirl.create(:submission)
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
  end

  it "visits submission page, finds and clicks rate button" do
    visit submission_path(@submission)
    click_button '4'
  end
end

Warden.test_reset!
