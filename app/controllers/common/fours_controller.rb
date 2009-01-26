module Common
  class FoursController < ApplicationController
    access_control do
      allow :admin, :admin_1
      allow :partner, :partner_1
    end

    def index
      render :text => "Hi, I'm controller 4! (only admins & partners allowed)", :layout => true
    end
  end
end

