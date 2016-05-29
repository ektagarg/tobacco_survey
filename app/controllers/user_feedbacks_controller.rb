class UserFeedbacksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_filter :authenticate_admin!
  before_action :set_user_feedback, only: [:show, :edit, :update, :destroy]
  # GET /user_feedbacks
  # GET /user_feedbacks.json
  def index
    @user_feedbacks = UserFeedback.all
  end

  # GET /user_feedbacks/1
  # GET /user_feedbacks/1.json
  def show
  end

  # GET /user_feedbacks/new
  def new
    @user_feedback = UserFeedback.new
  end

  # GET /user_feedbacks/1/edit
  def edit
  end

  # POST /user_feedbacks
  # POST /user_feedbacks.json
  def create
    @user_feedback = UserFeedback.new(user_feedback_params)

    respond_to do |format|
      if @user_feedback.save
        format.html { redirect_to @user_feedback, notice: 'User feedback was successfully created.' }
        format.json { render :show, status: :created, location: @user_feedback }
      else
        format.html { render :new }
        format.json { render json: @user_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_feedbacks/1
  # PATCH/PUT /user_feedbacks/1.json
  def update
    respond_to do |format|
      if @user_feedback.update(user_feedback_params)
        format.html { redirect_to @user_feedback, notice: 'User feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_feedback }
      else
        format.html { render :edit }
        format.json { render json: @user_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_feedbacks/1
  # DELETE /user_feedbacks/1.json
  def destroy
    @user_feedback.destroy
    respond_to do |format|
      format.html { redirect_to user_feedbacks_url, notice: 'User feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def last_feedback
    mobile_number = params[:mobile_number]
    mobile_numbers = UserFeedback.all.map{|m|m.mobile_number}
    if(mobile_numbers.include?mobile_number)
      user = UserFeedback.where(:mobile_number => mobile_number).last
      render :json => {:success=> true,:data => user.as_json(:only => [:current_brand,:current_variant, :other_brand, :other_variant,:no_of_sticks])}
      else
      render :json => {:success => false}
      end
  end
  
  def feedback
    puts params
    mobile_number = params[:mobile_number]
    current_brand = params[:current_brand]
    current_variant = params[:current_variant]
    other_brand = params[:other_brand]
    other_variant = params[:other_variant]
    no_of_sticks = params[:no_of_sticks]
    reason_cb = params[:reason_cb]
    reason_cv = params[:reason_cv]
    reason_ob = params[:reason_ob]
    reason_ov = params[:reason_ov]
    reason_sticks = params[:reason_sticks]
    UserFeedback.create!(:mobile_number => mobile_number,:current_brand => current_brand, :current_variant => current_variant, :other_brand => other_brand, :other_variant => other_variant, :no_of_sticks => no_of_sticks, :reason_cb => reason_cb, :reason_cv => reason_cv, :reason_ob => reason_ob, :reason_ov => reason_ov, :reason_sticks => reason_sticks)
    render :json => {:success => true}
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_feedback
    @user_feedback = UserFeedback.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_feedback_params
    params.require(:user_feedback).permit(:mobile_number, :current_brand, :current_variant, :other_brand, :other_variant, :no_of_sticks, :reason_cb, :reason_cv, :reason_ob, :reason_ov, :reason_sticks)
  end
end
