class UsersController < ApplicationController
filter_resource_access
def index
@usuarios = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
end
  def new    
  end
  
  def create
    @user = User.new(params[:user])
	@user.active=true
	if !current_user.admin?
	role=Role.find(2)
	assignment=Assignment.new
	assignment.role=role
	assignment.user=@user
	assignment.save
	end
    if @user.save_without_session_maintenance
      redirect_to root_url
    else
      render :action => :new
    end
  end

  
  def show
  end
  def destroy
  @user.destroy
  redirect_to users_url
  end
  
 
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end