module Contractor
  class ThreesController < ApplicationController
    access_control do
      allow :contractor
    end

    def index
      render :text => "Hi, I'm controller 3 (only contractors allowed)!", :layout => true
    end
  end
end

