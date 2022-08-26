class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update destroy edit hide show]
  
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: "Новый вопрос создан!"
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы вопроса!"

      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Вопрос удален!"
  end

  def edit
  end
  
  def hide
    @question.update!(hidden: true)

    redirect_to question_path(@question), notice: "Вопрос скрыт!"
  end

  def index
    @question = Question.new
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end

  def show
  end
  
  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "Вопрос сохранен!"
    else
      flash.now[:alert] = "При попытке сохранить вопрос возникли ошибки!"

      render :new
    end
  end 

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
