class ComentariosController < ApplicationController
  # GET /comentarios
  # GET /comentarios.xml
  
  filter_resource_access
  def index
  @comentable= find_comentable
    @comentarios =@comentable.comentarios

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end


  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
  @comentable= find_comentable
    @comentario = @comentable.comentarios.build(params[:comentario])

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentable }
        format.xml  { render :xml => @comentario, :status => :created, :location => @comentario }
      else
        format.html { flash[:notice] = "No se pudo añadir el comentario"
           redirect_to @comentable }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to(@comentario, :notice => 'El Comentario fue editado exitosamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    
    @comentario = Comentario.find(params[:id])
    @comentable = @comentario.comentable
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to(@comentable) }
      format.xml  { head :ok }
    end
  end
  private

  def find_comentable
  params.each do |name, value|
	if name=~ /(.+)_id$/
		return $1.pluralize.classify.constantize.find(value)
		#esta linea antes era return $1.classify.constantize.find(value) pero la cambie por lo que lei aqui de que los nombres en singular no los maneja bien http://rails.rubyonrails.org/classes/ActiveSupport/Inflector.html#M000719
		end
		end
		nil
  end
  
end
