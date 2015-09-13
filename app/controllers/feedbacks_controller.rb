class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit]
  before_action :authenticate_admin!, only: [:index, :edit]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        NewFeedbackMailer.new_feedback.deliver_now
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        flash[:danger] = 'Oops, something went wrong!  :('
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:meet_needs_answer, :suggestions, :challenges)
    end
end
