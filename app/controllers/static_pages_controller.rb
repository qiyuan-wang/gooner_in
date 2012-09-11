class StaticPagesController < ApplicationController
  layout "index", only: [:index]
  def index
    if logged_in?
      redirect_to questions_path
    end
  end

end
