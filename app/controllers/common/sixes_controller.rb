module Common
  class SixesController < ApplicationController
    access_control do
      allow :partner, :partner_1
      allow :contractor
    end

    def index
      render :text => "Hi, I'm controller 6! (only partners & contractors allowed)", :layout => true
    end
  end
end
