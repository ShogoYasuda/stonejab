class WelcomeController < ApplicationController
  def index

    ua = request.env["HTTP_USER_AGENT"]
    if(ua.include?('Mobile') || ua.include?('Android'))
      render template: "welcome/index_s"
    else
      render template: "welcome/index"
    end

  end

end
