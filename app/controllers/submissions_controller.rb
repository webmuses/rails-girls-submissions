class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create, :thank_you]

  # GET /submissions
  def index
    @submissions = Submission.all
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

  def rated
    @submissions_rated = Submission.where(rejected: false).joins(:rates).group(:id).having('count(*) >= ?', Submission::REQUIRED_RATES_NUM)
  end

  def to_rate
    @submissions_to_rate = Submission.where(rejected: false).joins("LEFT JOIN 'rates' ON submissions.id = rates.submission_id").group(:id).having('count(*) < ?', Submission::REQUIRED_RATES_NUM)
  end

  def rejected
    @submissions_rejected = Submission.where(rejected: true)
  end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
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
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:full_name, :email, :age, :codeacademy_username, :description, :html, :css, :js, :ror, :db, :programming_others, :english, :operating_system, :first_time, :goals, :problems)
    end
end
