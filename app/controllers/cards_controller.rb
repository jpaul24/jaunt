class CardsController < ApplicationController

  def thumb_up
    session[:ids] = []
  end

  def thumb_down

  end
end
