class AnswersController < ApplicationController
  before_action :set_answer, only: [:update, :destroy]
  load_and_authorize_resource

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to answers_url, notice: 'Respuesta fue creada exitosamente.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to answers_url, notice: 'Respuesta fue actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Respuesta fue eliminada exitosamente.'
  end

  private

  def answer_params
    params.require(:answer)
          .permit(:response_id, :question_id, options_attributes: [:id, :title,
                  :_destroy])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
