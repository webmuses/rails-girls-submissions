describe "the rating process" do
  before :each do
    @submission = FactoryGirl.create(:submission)
  end

  it "signs me in" do
    visit submission_path(@submission)
    click_button '4'
    #expect(page).to have_content 'Success'
  end
end
