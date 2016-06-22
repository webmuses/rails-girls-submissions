describe "testing updating settings:" do

  let!(:user) { FactoryGirl.create(:user) }

  it "moves to settings view, fills in the form fields, clicks save, checks if settings got updated" do
    login_as(user, scope: :user)
    visit settings_path
    fill_in 'Accepted threshold', with: 6
    fill_in 'Waitlist threshold', with: 6
    fill_in 'Required rates num', with: 6
    click_button "Save settings"
    expect(Setting.get.accepted_threshold).to eq(6)
    expect(Setting.get.waitlist_threshold).to eq(6)
    expect(Setting.get.required_rates_num).to eq(6)
  end
end
