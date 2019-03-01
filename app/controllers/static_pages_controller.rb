class StaticPagesController < ApplicationController
  def home
    @hotel = Hotel.all
  end

  def help; end

  def contact; end
end
