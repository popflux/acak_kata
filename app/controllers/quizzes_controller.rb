class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update]

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    @question = Question.order("RANDOM()").first
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    respond_to do |format|
      if @quiz.save
        if @quiz.answer == @quiz.question.name
          @quiz.update_points
          format.html { redirect_to @quiz, notice: "BENAR point anda = #{@quiz.points}" }
        else
          format.html { redirect_to edit_quiz_path(@quiz), notice: 'SALAH! silahkan coba lagi!' }
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        if @quiz.answer == @quiz.question.name
          @quiz.update_points
          format.html { redirect_to @quiz, notice: "BENAR point anda = #{@quiz.points}" }
        else
          format.html { redirect_to edit_quiz_path(@quiz), notice: 'SALAH! silahkan coba lagi!' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:question_id, :points, :answer, :shuffle_word)
    end
end
