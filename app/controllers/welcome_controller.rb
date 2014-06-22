class WelcomeController < ApplicationController
  def index
    puts request.env["HTTP_USER_AGENT"]
  end
end
