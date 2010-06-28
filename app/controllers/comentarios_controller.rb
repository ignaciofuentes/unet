class ComentariosController < ApplicationController
  # GET /comentarios
  # GET /comentarios.xml
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
        format.html { render :action => "new" }
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
        format.html { redirect_to(@comentario, :notice => 'Comentario was successfully updated.') }
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
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to(comentarios_url) }
      format.xml  { head :ok }
    end
  end
  private
def find_comentable
  params.each do |name, value|
	if name=~ /(.+)_id$/
		return $1.classify.constantize.find(value)
		end
		end
		nil
  end
  
end
