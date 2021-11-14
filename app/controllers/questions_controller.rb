class QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :destroy]
  load_and_authorize_resource

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_url, notice: 'Pregunta fue creada exitosamente.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_url, notice: 'Pregunta fue actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Pregunta fue eliminada exitosamente.'
  end

  private

  def question_params
    params.require(:question)
          .permit(:title, :order, :q_type, :required, options_attributes: [:id, :title,
                  :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
