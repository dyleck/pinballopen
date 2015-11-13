class StaticPagesController < ApplicationController
  skip_before_action :authorize

  def home
  end

  def faq
  end

  def about
  end

end
