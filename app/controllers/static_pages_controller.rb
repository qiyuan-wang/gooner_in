class StaticPagesController < ApplicationController
  layout "index", only: [:index]
  def index
    if logged_in?
      redirect_to answers_path
    end
    @question = Question.first
    @players = Player.all.limit(7)
  end

end
