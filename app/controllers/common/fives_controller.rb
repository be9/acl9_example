module Common
  class FivesController < ApplicationController
    access_control do
      allow :admin, :admin_1
      allow :contractor
    end

    def index
      render :text => "Hi, I'm controller 5! (only admins & contractors allowed)", :layout => true
    end
  end
end


