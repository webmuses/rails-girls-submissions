class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create, :thank_you]
  layout 'dashboard', only: [:all, :rated, :to_rate, :rejected]

  # GET /submissions
  def all
    @submissions = Submission.all
  end

  def rated
    @submissions_rated = Submission.rated
  end

  def to_rate
    @submissions_to_rate = Submission.to_rate
  end

  def rejected
    @submissions_rejected = Submission.rejected
  end

  # GET /submissions/1
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  def thank_you
  end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.valid?
      submission_rejector = SubmissionRejector.new.reject_if_any_rules_broken(@submission)
      @submission.save

      redirect_to submissions_thank_you_url
    else
      render :new
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:full_name, :email, :age,
      :codecademy_username, :description, :html, :css, :js, :ror, :db,
      :programming_others, :english, :operating_system, :first_time, :goals,
      :problems)
    end
end
