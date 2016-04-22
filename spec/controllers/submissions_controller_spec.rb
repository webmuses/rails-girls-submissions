require "rails_helper"

RSpec.describe SubmissionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject { post :create, submission: submission_attributes }

    context "with vaild submission parameters" do
      let(:submission_attributes) do {
        full_name: "Jan Kowalski",
        email: "kowalski@domain.com",
        age: 20,
        codeacademy_username: "jan_kowalski",
        description: "I want to be a programmer!/n I want to be a programmer!",
        html: :used,
        css: :used,
        js: :used,
        ror: :used,
        db: :used,
        programming_others: :used,
        english: :basic,
        operating_system: :mac,
        first_time: true,
        goals: "Job as a developer/n",
        problems: "Allergic to dairy" }
      end

      it "redirects to new submission" do
        expect(subject).to redirect_to(assigns(:submission))
      end

      it "saves the new submission" do
        expect{subject}.to change(Submission, :count).by(1)
        #TODO: is this solution recommended? 
      end
    end

    context "with invaild submission parameters" do
      let(:submission_attributes) do
        { full_name: "NN", email: "nn", age: 200 }
      end

      it "shows form again" do
        expect(subject).to render_template(:new)
      end

      it "does not save the new submission" do
        expect{subject}.not_to change(Submission, :count)
      end
    end
  end
end
