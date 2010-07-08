class MensajesController < ApplicationController
  # GET /mensajes
  # GET /mensajes.xml
  def index
	if params[:bandeja]=="Recibidos"
	  @bandeja = "Recibidos"
    @mensajes = current_user.mensajes_recibidos
	else
	  @bandeja = "Enviados"
	  @mensajes = current_user.mensajes_enviados
	end
    end


  # GET /mensajes/1
  # GET /mensajes/1.xml
  def show
    @mensaje = Mensaje.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mensaje }
    end
  end

  # GET /mensajes/new
  # GET /mensajes/new.xml
  def new
    @mensaje = Mensaje.new
	@mensaje.receptor_login=params[:receptor]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mensaje }
    end
  end


  # POST /mensajes
  # POST /mensajes.xml
  def create
    @mensaje = Mensaje.new(params[:mensaje])
    @mensaje.emisor=current_user
      if @mensaje.save
        flash[:notice] = 'El Mensaje fue enviado exitosamente' 
		redirect_to @mensaje
      else
	  flash[:error] = 'El Mensaje no se pudo enviar.'
        render :action => "new"
    end
  end

 

  # DELETE /mensajes/1
  # DELETE /mensajes/1.xml
  def destroy
    @mensaje = Mensaje.find(params[:id])
    @mensaje.destroy

    respond_to do |format|
      format.html { redirect_to(mensajes_url) }
      format.xml  { head :ok }
    end
  end
  
end
