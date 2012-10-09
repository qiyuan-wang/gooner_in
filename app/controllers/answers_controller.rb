class AnswersController < ApplicationController
  before_filter :require_login, only: [:create, :new]
  before_filter :find_question, except: [:index, :like, :unlike]
  before_filter :answer_authentication, only: [:new, :create]
  
  def index
    @answers = Answer.most_likes.page params[:page]
  end
  
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
        @answer.get_summary
        @question.answered_by current_user
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @question.pull(:answered_users, current_user.id)
    @answer.destroy
    respond_to do |format|
      format.html { redirect_back_or_to question_path @question }
      format.json { head :no_content }
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
  end
  
  def edit
    @answer = Answer.find(params[:id])
    #@question = @answer.question
  end
  
  def update
    @answer = Answer.find(params[:id])
    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        @answer.get_summary
        format.html { redirect_to @question }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "edit" }
      end
    end
  end
    

  def like
    @answer = Answer.find(params[:id])
    @answer.like_by current_user
    respond_to do |format|
      format.js { render :layouts => false }
    end
  end
  
  def unlike
    @answer = Answer.find(params[:id])
    @answer.unlike_by current_user
    #render :text => @answer.reload.likes_count
    respond_to do |format|
      format.js { render :like, :layouts => false }
    end
  end
  
  protected
  def find_question
    @question = Question.find(params[:question_id])
  end
  
  #防止用户通过地址栏直接请求到new页面，从而多次回答同一问题
  def answer_authentication
    if @question.answered_by? current_user
      redirect_to question_path @question
    end
  end
end
