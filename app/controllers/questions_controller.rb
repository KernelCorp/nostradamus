class QuestionsController < ApplicationController
  #before_action :set_category
  #before_action :set_question, only: [:show, :edit, :update, :destroy, :close]
  load_resource :category
  load_and_authorize_resource :question, through: :category

  # GET /questions
  # GET /questions.json
  def index
    #@questions = @category.questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    #@question = @category.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    #@question = @category.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@category, @category.questions.new], notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@category, @question], notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to category_questions_url }
      format.json { head :no_content }
    end
  end

  def go_to_close

  end

  def close
    if !params[:right_answer].blank? && @question.active?
      @question.update_attributes! status: 'closed', right_answer: params[:right_answer]
      @question.yield_outcome
    end
    redirect_to category_questions_path(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @category.questions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :image, :text, :end_date, :start_date)
    end

    def set_category
      @category = Category.find params[:category_id]
    end
end
