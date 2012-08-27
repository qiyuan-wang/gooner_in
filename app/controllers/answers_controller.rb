class AnswersController < ApplicationController
  before_filter :require_login, only: [:create]
  before_filter :find_question, only: [:new, :create]
  
  def new
    @answer = current_user.answers.new question: @question
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end
  
  def create
    @answer = current_user.answers.new params[:answer]
    @answer.question = @question
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def like
    @answer = Answer.find(params[:id])
    @answer.like_by current_user
    render :text => @answer.reload.likes_count
  end
  
  def unlike
    @answer = Answer.find(params[:id])
    @answer.unlike_by current_user
    render :text => @answer.reload.likes_count
  end
  
  protected
  def find_question
    @question = Question.find(params[:question_id])
  end 
end
