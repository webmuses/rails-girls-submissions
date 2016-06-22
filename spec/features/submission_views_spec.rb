describe "testing submissions views:" do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:submission_to_rate) { FactoryGirl.create(:submission, full_name: "Applicant To Rate") }
  let!(:submissions_rated) { FactoryGirl.create(:submission, :rated,
    required_rates_num: FactoryGirl.create(:settings).required_rates_num, full_name: "Applicant Rated") }
  let!(:submission_rejected) { FactoryGirl.create(:submission, rejected: true, full_name: "Applicant Rejected") }

  it "moves to to_rate view" do
    login_as(user, scope: :user)
    visit submissions_path
    click_link "To rate"
    expect(current_path).to eq submissions_to_rate_path
    expect(page).to have_selector('td', text: "Applicant To Rate")
  end

  it "moves to rated view" do
    login_as(user, scope: :user)
    visit submissions_path
    click_link "Rated"
    expect(current_path).to eq submissions_rated_path
    expect(page).to have_selector('td', text: "Applicant Rated")
  end

  it "moves to rejected view" do
    login_as(user, scope: :user)
    visit submissions_path
    click_link "Rejected"
    expect(current_path).to eq submissions_rejected_path
    expect(page).to have_selector('td', text: "Applicant Rejected")
  end
end
