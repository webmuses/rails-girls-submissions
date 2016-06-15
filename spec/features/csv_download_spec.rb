describe "csv downloading process" do
  let!(:user) { FactoryGirl.create(:user) }

  it "visits settings page, clicks 'Accepted', checks if csv file is downloaded" do
    login_as(user, scope: :user)
    visit submissions_settings_path
    click_link('Accepted')
    expect(response_headers["Content-Type"]).to eq("text/csv")
    expect(response_headers["Content-Disposition"]).to eq("attachment; filename=\"accepted.csv\"")
  end

  it "visits settings page, clicks 'Waitlist', checks if csv file is downloaded" do
    login_as(user, scope: :user)
    visit submissions_settings_path
    click_link('Waitlist')
    expect(response_headers["Content-Type"]).to eq("text/csv")
    expect(response_headers["Content-Disposition"]).to eq("attachment; filename=\"waitlist.csv\"")
  end

  it "visits settings page, clicks 'Unaccepted', checks if csv file is downloaded" do
    login_as(user, scope: :user)
    visit submissions_settings_path
    click_link('Unaccepted')
    expect(response_headers["Content-Type"]).to eq("text/csv")
    expect(response_headers["Content-Disposition"]).to eq("attachment; filename=\"unaccepted.csv\"")
  end
end
