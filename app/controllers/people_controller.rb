class PeopleController < ApplicationController
  before_filter :find_person
  def show
  end
  
  private
  def find_person
    @person = User.find_by(name: params[:name])
    raise Mongoid::Errors::DocumentNotFound.new(User, params[:name]) if @person.nil?
  end
end
