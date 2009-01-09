class UsersController < ApplicationController
  before_filter :require_user
  before_filter :set_allowed_roles
  before_filter :load_user,      :except => [:index, :new, :create]
  before_filter :allow_to_edit?, :only =>   [:edit, :update, :destroy]
  before_filter :get_role,       :only =>   [:create, :update]

  access_control do
    allow :partner_0
    allow :admin_0
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if check_and_set_role && @user.save
      flash[:notice] = "Account registered!"
      redirect_to @user
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if check_and_set_role && @user.update_attributes(params[:user]) 
      flash[:notice] = "User account updated!"
      redirect_to @user
    else
      render :action => :edit
    end
  end

  private

  def set_allowed_roles
    @allowed_roles = if current_user.has_role?(:admin_0)
                      User::ROLES
                    elsif current_user.has_role?(:partner_0)
                      %w(partner_1 partner_2)
                    else
                      # WTF
                      []
                    end
  end

  def check_and_set_role
    return true if @user == current_user

    if @allowed_roles.include?(@role)
      @user.has_no_roles!
      @user.has_role!(@role)

      true
    else
      @user.errors.add(:base, 'You cannot assign this role to this user')

      false
    end
  end

  def load_user
    @user = User.find(params[:id])
  end

  def get_role
    @role = params[:user].delete('role')
  end

  def allow_to_edit?
    unless @user == current_user || @allowed_roles.include?(@user.role)
      flash[:notice] = "You cannot edit this user!"
      redirect_to users_path
    end
  end
end
