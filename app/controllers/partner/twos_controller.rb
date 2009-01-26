module Partner
  class TwosController < ApplicationController
    access_control do
      allow :partner, :partner_1
    end

    def index
      render :text => "Hi, I'm controller 2 (only partners allowed)!", :layout => true
    end
  end
end

