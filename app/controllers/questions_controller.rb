class QuestionsController < ApplicationController
<<<<<<< HEAD
  before_action :set_question, only: %i[update destroy edit hide show]
  
  def create
    @question = Question.create(question_params)
=======
  before_action :set_question, only: %i[update show destroy edit hide]
  
  def create
    Question.create(question_params)
>>>>>>> 121d3be53df4b0a22d7c6a1ec8faf08368ca7428

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def edit
  end
  
  def hide
<<<<<<< HEAD
    @question = Question.update!(hidden: true)
=======
    @question.update!(hidden: true)
>>>>>>> 121d3be53df4b0a22d7c6a1ec8faf08368ca7428

    redirect_to question_path(@question)
  end

  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end

  def show
  end
  
  def update
<<<<<<< HEAD
    @question.update(question_params)
=======
    @question = Question.find(question_params)
>>>>>>> 121d3be53df4b0a22d7c6a1ec8faf08368ca7428

    redirect_to question_path(@question)
  end 

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
