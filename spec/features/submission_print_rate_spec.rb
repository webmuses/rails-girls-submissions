describe "printing submission's rates in submission show view" do

let!(:submission) { FactoryGirl.create(:submission) }
let!(:user) { FactoryGirl.create(:user) }
  context "when the submission has required number of rates" do

    it "shows ratings in submission view" do
      SubmissionRepository::REQUIRED_RATES_NUM.times do
        rate = FactoryGirl.create(:rate)
        submission.rates << rate
      end
      sample_rate = submission.rates.sample

      login_as(user, scope: :user)
      visit submission_path(submission.id)
      expect(page).to have_text("#{sample_rate.user.nickname} #{sample_rate.value}")
    end
  end

  context "when the submission does not have required number of rates" do

    it "does not show ratings in submission view" do
      (SubmissionRepository::REQUIRED_RATES_NUM - 1).times do
        rate = FactoryGirl.create(:rate)
        submission.rates << rate
      end
      sample_rate = submission.rates.sample

      login_as(user, scope: :user)
      visit submission_path(submission.id)
      expect(page).not_to have_text("#{sample_rate.user.nickname} #{sample_rate.value}")
    end
  end
end
