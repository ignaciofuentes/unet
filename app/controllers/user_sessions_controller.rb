class UserSessionsController < ApplicationController
  
  def new
    if(current_user)
      redirect_to actividades_url
    end
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login Exitoso"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout exitoso"
    redirect_to root_url
  end
end