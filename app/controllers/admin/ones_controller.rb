module Admin
  class OnesController < ApplicationController
    access_control do
      allow :admin, :admin_1
    end

    def index
      render :text => "Hi, I'm controller 1! (only admins allowed)", :layout => true
    end
  end
end
