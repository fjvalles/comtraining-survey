class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: :we_survey
  skip_before_action :verify_authenticity_token
  before_action :set_survey, only: [:show, :section1, :section2, :section3, :confirmation, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @title = 'REGISTRO'
    @surveys = Survey.all
  end

  def show
  end

  def section1
  end

  def section2
  end

  def section3
  end

  def confirmation
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to surveys_url, notice: 'Encuesta fue creada exitosamente.'
    else
      render :new
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to surveys_url, notice: 'Encuesta fue actualizada exitosamente.'
    else
      render :edit
    end
  end

  def create_or_update
    @survey = Survey.find_by(company_id: params[:survey][:company_id],
                             s_type: params[:survey][:s_type])
    if @survey.present?
      if @survey.update(survey_params)
        redirect_back(fallback_location: gnrl_format_surveys_url, notice: 'Datos guardados exitosamente')
      else
        redirect_back(fallback_location: gnrl_format_surveys_url, notice: 'Error al actualizar. Inténtelo nuevamente.')
      end
    else
      @survey = Survey.new(survey_params)
      if @survey.save
        redirect_back(fallback_location: gnrl_format_surveys_url, notice: 'Datos guardados exitosamente')
      else
        redirect_back(fallback_location: gnrl_format_surveys_url, notice: 'Error al crear. Inténtelo nuevamente.')
      end
    end
  end

  def gnrl_format
    @title = 'CONFIGURACIÓN - Formatos Generales'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def answer_scale
    @title = 'CONFIGURACIÓN - Formato Escala Respuesta'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    @current_q_scale = params[:q_scale]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    @survey.question_defaults.build unless @survey.question_defaults.present?
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def demo_quest
    @title = 'CONFIGURACIÓN - Preguntas Demográficas'
    @quest_type = 'demo'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present? && params[:s_type].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
    end
    @survey = Survey.new unless @survey.present?
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def proficiencies
    @title = 'CONFIGURACIÓN - Factores/Competencias'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def questionnaire
    @title = 'CONFIGURACIÓN - Preguntas'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def participants
    @title = 'CAPTURA DATOS - Lista de Participantes'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def evaluators
    @title = 'CAPTURA DATOS - Evaluadores 360°'
    @current_company = params[:company_id]
    @current_s_type = params[:s_type]
    if params[:company_id].present?
      @survey = Survey.find_by(company_id: params[:company_id], s_type: params[:s_type])
      @survey = Survey.new unless @survey.present?
    else
      @survey = Survey.new
    end
    respond_to do |format|
      format.html
      format.js { render 'refill.js.erb' }
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Encuesta fue eliminada exitosamente.'
  end

  def we_survey
    @survey = Survey.find_by(token: params[:token], active: true)
    @response = Response.new
  end

  private

  def survey_params
    params.require(:survey)
          .permit(:title, :description, :active, :company_id, :s_type, :start_date,
                  :end_date, :welcome_msg, :instructions, :demographic_title,
                  :questionaire_title, :open_questions_title, :goodbye_msg,
                  :questionnaire_scale, :default_alignment,
                  questions_attributes: [:id, :order, :title, :scale, :q_type, :required,
                  :proficiency_id, :_destroy, options_attributes: [:id, :order, :title, :_destroy]],
                  proficiencies_attributes: [:id, :name, :description, :_destroy],
                  question_defaults_attributes: [:id, :q_type, :_destroy,
                  options_attributes: [:id, :order, :title, :_destroy]],
                  employees_attributes: [:id, :first_name, :last_name, :work_email,
                  :job_title, :work_area, :evaluator_id, :_destroy])
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
