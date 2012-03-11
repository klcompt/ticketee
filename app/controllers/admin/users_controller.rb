class Admin::UsersController < Admin::BaseController 
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all(:order => "Email")
  end
  
  def new
    @user = User.new
  end

  def create
    is_admin = params[:user].delete(:admin) == "1"
    @user = User.new(params[:user])
    @user.admin = is_admin
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end

  def edit

  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user.admin= params[:user].delete(:admin) == "1"
    if @user.update_attributes(params[:user])
      flash[:alert] = "User has been updated."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end

  def show

  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
