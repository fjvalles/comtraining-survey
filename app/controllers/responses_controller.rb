class ResponsesController < ApplicationController
  before_action :set_survey, only: [:index, :create, :destroy]
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def general
    @responses = Response.all
  end

  def index
    @responses = @survey.responses
  end

  def show
  end

  def welcome
    @survey = Survey.find_by(token: params[:token])
  end

  def new
    @survey = Survey.find_by(token: params[:token])
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    @response.user = current_or_guest_user
    if @response.save

    else
      render :new
    end
  end

  def destroy
    @response.destroy
    redirect_to responses_url, notice: 'Respuesta fue eliminada exitosamente.'
  end

  private

  def response_params
    params.require(:response)
          .permit(:survey_id, answers_attributes: [:id, :question_id, :_destroy,
                  :a_text, option_ids: []])
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end
end
