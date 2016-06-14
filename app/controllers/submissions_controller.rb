class SubmissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :thank_you]
  layout 'dashboard', only: [:all, :rated, :to_rate, :rejected, :settings]

  # GET /submissions
  def all
    submissions = Submission.all

    render :all, locals: { submissions: submissions }
  end

  def rated
    submissions_rated = Submission.rated

    render :rated, locals: { submissions_rated: submissions_rated }
  end

  def to_rate
    submissions_to_rate = Submission.to_rate

    render :to_rate, locals: { submissions_to_rate: submissions_to_rate }
  end

  def rejected
    submissions_rejected = Submission.rejected

    render :rejected, locals: { submissions_rejected: submissions_rejected }
  end

  def settings
    @submissions = Submission.all

    respond_to do |format|
      format.html
      format.csv do
        csv_generator = CsvGenerator.new
        submissions_data = csv_generator.to_csv(@submissions)
        send_data submissions_data
      end
    end
  end

  # GET /submissions/1
  def show
    submission = Submission.find(params[:id])
    comment = Comment.new

    rate_presenters = create_rate_presenters(submission.rates)
    comment_presenters = create_comment_presenters(submission.comments)

    render :show, locals: { comment: comment, submission: submission,
      comment_presenters: comment_presenters, rate_presenters: rate_presenters }
  end

  # GET /submissions/new
  def new
    submission = Submission.new

    render :new, locals: { submission: submission }
  end

  def thank_you
  end

  # POST /submissions
  def create
    submission = Submission.new(submission_params)

    if submission.valid?
      submission_rejector = SubmissionRejector.new.reject_if_any_rules_broken(submission)
      submission.save

      redirect_to submissions_thank_you_url
    else
      render :new, locals: { submission: submission }
    end
  end

  # DELETE /submissions/1
  def destroy
    submission = Submission.find(params[:id])
    submission.destroy

    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end

  private
    def submission_params
      params.require(:submission).permit(:full_name, :email, :age,
      :codecademy_username, :description, :html, :css, :js, :ror, :db,
      :programming_others, :english, :operating_system, :first_time, :goals,
      :problems)
    end

    def create_rate_presenters(rates)
      rates.map { |rate| RatePresenter.new(rate, rate.user) }
    end

    def create_comment_presenters(comments)
      comments.map { |comment| CommentPresenter.new(comment, comment.user) }
    end
end
