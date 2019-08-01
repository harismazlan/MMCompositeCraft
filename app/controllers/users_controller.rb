# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    if params[:search]
      @users = User.all.search_user(params[:search]).page params[:page]
    else
      @users = User.all
      @users = @users.order(id: :asc).page(params[:page])
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        # creates a new session if user is saved, and redirects the user to the profile
        format.html { redirect_to user_path(@user.id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # check if pasword field is filled or not
    if params[:user][:password] != '' && params[:user][:password_confirmation] != ''
      # if filled, check for the length
      if params[:user][:password].length > 6 && params[:user][:password_confirmation].length > 6
        # if true, update user profile & password
        if @user.update(user_params)
          redirect_to root_path
          flash[:success] = 'Profile updated'
        else
          redirect_to edit_user_path(@user.id)
          flash[:error] = 'Something is wrong, please try again!'
        end
      # if password & password confirmation length < 7, return to edit_user_path
      else
        redirect_to edit_user_path(@user.id)
        flash[:error] = 'Something is wrong, please try again!'
      end
    # if password field is not filled, update without updating user password
    elsif @user.update(user_params)
      redirect_to root_path
      flash[:success] = 'Profile updated'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
  end
end
