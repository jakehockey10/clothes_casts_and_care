class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :destroy]

  def index
    @patterns = Pattern.all
  end

  def show
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @pattern = Pattern.new(pattern_params)

    if @pattern.save
      flash[:success] = "The pattern #{@pattern.name} has been uploaded."
      redirect_to patterns_path
    else
      flash[:danger] = @pattern.errors.full_messages
      redirect_to :back
      # render js: "$('#upload-modal .modal-body').prepend('#{j render 'shared/_error_messages', locals: { object: @pattern } } ');"
    end
  end

  def destroy
    @pattern.destroy
    flash[:success] = "The pattern #{@pattern.name} has been deleted."
    redirect_to patterns_path
  end

  private

    def pattern_params
      params.require(:pattern).permit(:name, :admin_id, :attachment)
    end

    def set_pattern
      @pattern = Pattern.find(params[:id])
    end
end
