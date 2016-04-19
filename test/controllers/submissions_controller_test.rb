require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, submission: { age: @submission.age, codeacademy_username: @submission.codeacademy_username, description: @submission.description, email: @submission.email, english: @submission.english, experience: @submission.experience, first_time: @submission.first_time, full_name: @submission.full_name, goals: @submission.goals, operating_system: @submission.operating_system, problems: @submission.problems }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, id: @submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission
    assert_response :success
  end

  test "should update submission" do
    patch :update, id: @submission, submission: { age: @submission.age, codeacademy_username: @submission.codeacademy_username, description: @submission.description, email: @submission.email, english: @submission.english, experience: @submission.experience, first_time: @submission.first_time, full_name: @submission.full_name, goals: @submission.goals, operating_system: @submission.operating_system, problems: @submission.problems }
    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission
    end

    assert_redirected_to submissions_path
  end
end
