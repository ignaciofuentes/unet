class UsersController < ApplicationController
filter_resource_access

def index
	@usuarios = User.search(params[:term])
end

  def new    
  end
  
  def create
    @user = User.new(params[:user])
	@user.active=true
	parametros_de_usuarios_convencionales
    if @user.save_without_session_maintenance
      redirect_to users_path
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
  parametros_de_usuarios_convencionales
    if @user.update_attributes(params[:user])
      flash[:notice] = "Cuenta actualizada!"
      redirect_to users_path
    else
      render :action => :edit
    end
  end
  
    def parametros_de_usuarios_convencionales
  if !has_role? :admin
	role=Role.find(3)
		assignment=Assignment.new
		assignment.role=role
		assignment.user=@user
		assignment.save
		@user.grupo_estudiantil=current_user.grupo_estudiantil
	end
  end
  
end