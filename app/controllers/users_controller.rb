class UsersController < ApplicationController

def index
@usuarios = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
end
  def new
    @user = User.new     
  end
  
  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
	if !current_user.admin?
	role=Role.find(2)
	assignment=Assignment.new
	assignment.role=role
	assignment.user=@user
	assignment.save
	#grupo=
	end
    if @user.save_without_session_maintenance
      
      #@user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  
  def show
@user=User.find(params[:id])
  end
 
  def edit
    @user = @current_user
    @roles=roles_posibles
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end