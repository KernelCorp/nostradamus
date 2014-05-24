class AnswersController < ApplicationController
  def create
    category = Category.find params[:category_id]
    question = category.questions.find params[:question_id]
    @answer = question.answers.create value: params[:value], user: current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
end
