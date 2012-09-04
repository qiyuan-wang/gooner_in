class StaticPagesController < ApplicationController
  layout "index", only: [:index]
  def index
  end

end
