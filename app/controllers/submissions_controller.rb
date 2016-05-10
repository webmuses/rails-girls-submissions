class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, :except => [:new, :create, :thank_you]

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

  # GET /submissions/1/edit
  def edit
  end

  def thank_you
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

  # PATCH/PUT /submissions/1
  def update
    byebug
    if @submission.update(submission_params)
        redirect_to @submission, notice: 'Submission was successfully updated.'
    else
      render :edit
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
