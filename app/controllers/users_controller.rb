# Users Controller
class UsersController < ApplicationController
	before_action :set_general_setting
  def index
    @users = User.all
  end

  # create new object of User
  # this method is used when user Sign_up for system
  def new
    @user = User.new
  end

  def view_all_details
    @users = User.all
  end

  # create User object and pass required parameters
  # from private method user_params and
  # create action is saving our new User to the database.
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # find User from database which we have selected,
  # and find that user information like username,name,role,email
  def show
    @user = User.shod(params[:id])
  end

  # find User which we want to edit and pass it to update method
  # and perform authorization
  def edit
    @user = User.shod(params[:id])
  end

  # upadate method update a User,
  # and it accepts a hash containing the attributes that you want to update.
  # and perform authorization
  def update
    @user = User.shod(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  # find User which we want to change password and
  # pass it to update_password method
  # and perform authorization
  def change_password
    @user = User.shod(params[:id])
  end

  # update_password method update a User Password,
  # and it accepts a hash containing the attributes that you want to update.
  # and perform authorization
  def update_password
    @user = User.shod(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'change_password'
    end
  end


  # find User which we want to destroy,
  # destroy method deleting that User from the
  # database and perform authorization
  def destroy
    @user = User.shod(params[:id])
    @user.delete
    flash[:user_delete] = t('user_delete')
    redirect_to users_path
  end

  private

  def set_general_setting
  	    @general_setting = GeneralSetting.first
  end

  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.
  def user_params
    params.require(:user).permit!
  end
end