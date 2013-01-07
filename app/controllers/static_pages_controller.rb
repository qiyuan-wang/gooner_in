class StaticPagesController < ApplicationController
  layout "index", only: [:index]
  def index
    if request.env['HTTP_USER_AGENT'] =~ /msie/i
      redirect_to :log_in
    elsif logged_in?
      redirect_to answers_path
    end
  end
end