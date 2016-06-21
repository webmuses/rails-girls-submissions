describe "printing submission's rates in submission show view" do

let!(:submission) { FactoryGirl.create(:submission) }
let!(:user) { FactoryGirl.create(:user) }
  context "when the submission has required number of rates" do

    before { submission.rates << FactoryGirl.build_list(:rate, Settings.get.required_rates_num) }

    it "shows ratings in submission view" do
      sample_rate = submission.rates.sample
      login_as(user, scope: :user)
      visit submission_path(submission.id)
      expect(page).to have_text("#{sample_rate.user.nickname} #{sample_rate.value}")
    end
  end

  context "when the submission does not have required number of rates" do

    before { submission.rates << FactoryGirl.build_list(:rate, Settings.get.required_rates_num-1) }

    it "does not show rates in submission view" do
      sample_rate = submission.rates.sample
      login_as(user, scope: :user)
      visit submission_path(submission.id)
      expect(page).not_to have_text("#{sample_rate.user.nickname} #{sample_rate.value}")
    end
  end
end
