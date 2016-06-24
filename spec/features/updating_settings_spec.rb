describe "testing updating settings:" do

  let!(:user) { FactoryGirl.create(:user) }

  it "moves to settings view, fills in the form fields, clicks save, checks if settings got updated" do
    login_as(user, scope: :user)
    visit settings_path
    fill_in 'Accepted threshold', with: 6
    fill_in 'Waitlist threshold', with: 6
    fill_in 'Required rates num', with: 6
    fill_in 'Beginning of preparation period', with: "2016/06/21"
    fill_in 'Beginning of registration period', with: "2016/06/22"
    fill_in 'Beginning of closed period', with: "2016/06/23"
    click_button "Save settings"
    expect(Setting.get.accepted_threshold).to eq(6)
    expect(Setting.get.waitlist_threshold).to eq(6)
    expect(Setting.get.required_rates_num).to eq(6)
    expect(Setting.get.beginning_of_preparation_period).to eq("Thu, 21 Jun 2016 00:00:00 CEST +02:00")
    expect(Setting.get.beginning_of_registration_period).to eq("Thu, 22 Jun 2016 00:00:00 CEST +02:00")
    expect(Setting.get.beginning_of_closed_period).to eq("Thu, 23 Jun 2016 00:00:00 CEST +02:00")
  end
end
