class HomeController < ApplicationController
  def index
    redirect_to courses_path
  end

  def about

  end

  def home
    redirect_to courses_path
  end

  def contact

  end
end
