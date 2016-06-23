require "rails_helper"

RSpec.describe SubmissionsController, type: :controller do

  describe "POST #create" do
    subject { post :create, submission: submission_attributes }

    context "with vaild submission parameters" do
      let(:submission_attributes) do
         FactoryGirl.attributes_for(:submission)
      end

      it "redirects to thank you page" do
        expect(subject).to redirect_to("/submissions/thank_you")
      end

      it "saves the new submission" do
        expect{subject}.to change(Submission, :count).by(1)
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
