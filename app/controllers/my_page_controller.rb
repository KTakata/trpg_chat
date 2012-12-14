class MyPageController < ApplicationController
before_filter :authorize
  def index
binding.pry
  end
end
