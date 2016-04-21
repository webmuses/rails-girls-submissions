require "rails_helper"

RSpec.describe SubmissionsController, type: :controller do
  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "POST #create" do
    context "with vaild submission parameters" do

      subject {post :create, submission: {full_name: "Jan Kowalski", email: "kowalski@domain.com", age: 20, codeacademy_username: "jan_kowalski",
      description: "I want to be a programmer!/n I want to be a programmer!", html: :used, css: :used, js: :used, ror: :used, db: :used,
      programming_others: :used, english: :basic, operating_system: :mac, first_time: true, goals: "Job as a developer/n", problems: "Allergic to dairy"}}

      it "redirects to new submission" do
        expect(subject).to redirect_to(assigns(:submission))
      end

      it "saves the new submission" do
        expect{subject}.to change(Submission, :count).by(1)
      end
    end
  end


end
