require 'test_helper'

class UserFeedbacksControllerTest < ActionController::TestCase
  setup do
    @user_feedback = user_feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_feedback" do
    assert_difference('UserFeedback.count') do
      post :create, user_feedback: { current_brand: @user_feedback.current_brand, current_variant: @user_feedback.current_variant, mobile_number: @user_feedback.mobile_number, no_of_sticks: @user_feedback.no_of_sticks, other_brand: @user_feedback.other_brand, other_variant: @user_feedback.other_variant, reason_cb: @user_feedback.reason_cb, reason_cv: @user_feedback.reason_cv, reason_ob: @user_feedback.reason_ob, reason_ov: @user_feedback.reason_ov, reason_sticks: @user_feedback.reason_sticks }
    end

    assert_redirected_to user_feedback_path(assigns(:user_feedback))
  end

  test "should show user_feedback" do
    get :show, id: @user_feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_feedback
    assert_response :success
  end

  test "should update user_feedback" do
    patch :update, id: @user_feedback, user_feedback: { current_brand: @user_feedback.current_brand, current_variant: @user_feedback.current_variant, mobile_number: @user_feedback.mobile_number, no_of_sticks: @user_feedback.no_of_sticks, other_brand: @user_feedback.other_brand, other_variant: @user_feedback.other_variant, reason_cb: @user_feedback.reason_cb, reason_cv: @user_feedback.reason_cv, reason_ob: @user_feedback.reason_ob, reason_ov: @user_feedback.reason_ov, reason_sticks: @user_feedback.reason_sticks }
    assert_redirected_to user_feedback_path(assigns(:user_feedback))
  end

  test "should destroy user_feedback" do
    assert_difference('UserFeedback.count', -1) do
      delete :destroy, id: @user_feedback
    end

    assert_redirected_to user_feedbacks_path
  end
end
