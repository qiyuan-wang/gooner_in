# coding: utf-8
class PeopleController < ApplicationController
  before_filter :find_person
  def show
    @questions = @person.questions.recent[1..10]
  end
  
  def questions_list
    @questions = @person.questions.recent.page params[:page]
  end
  
  private
  def find_person
    @person = User.find_by(name: params[:name])
    raise Mongoid::Errors::DocumentNotFound.new(User, params[:name]) if @person.nil?
    if @person == current_user
      @name = "我"
    else
      @name = "Ta"
    end
  end
end
