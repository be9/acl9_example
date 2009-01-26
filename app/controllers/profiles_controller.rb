class ProfilesController < ApplicationController
  before_filter :require_user
  before_filter :set_user

  def show
  end

  def edit
  end

  def update
    attrs = params[:user].slice(*%w(first_name last_name email password password_confirmation))

    if @user.update_attributes(attrs)
      flash[:notice] = "Your profile has been successfully updated."
      redirect_to profile_path
    else
      render :action => :edit
    end
  end

  private

  def set_user
    @user = current_user
  end
end
