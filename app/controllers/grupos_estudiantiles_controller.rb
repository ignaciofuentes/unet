class GruposEstudiantilesController < ApplicationController
  # GET /grupos_estudiantiles
  # GET /grupos_estudiantiles.xml
  def index
    @grupos_estudiantiles = GrupoEstudiantil.all
  end

  # GET /grupos_estudiantiles/1
  # GET /grupos_estudiantiles/1.xml
  def show
    @grupo_estudiantil = GrupoEstudiantil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grupo_estudiantil }
    end
  end

  # GET /grupos_estudiantiles/new
  # GET /grupos_estudiantiles/new.xml
  def new
    @grupo_estudiantil = GrupoEstudiantil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grupo_estudiantil }
    end
  end

  # GET /grupos_estudiantiles/1/edit
  def edit
    @grupo_estudiantil = GrupoEstudiantil.find(params[:id])
  end

  # POST /grupos_estudiantiles
  # POST /grupos_estudiantiles.xml
  def create
    @grupo_estudiantil = GrupoEstudiantil.new(params[:grupo_estudiantil])

    respond_to do |format|
      if @grupo_estudiantil.save
        flash[:notice] = 'Grupo Estudiantil creado exitosamente.'
        format.html { redirect_to(@grupo_estudiantil) }
        format.xml  { render :xml => @grupo_estudiantil, :status => :created, :location => @grupo_estudiantil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grupo_estudiantil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /grupos_estudiantiles/1
  # PUT /grupos_estudiantiles/1.xml
  def update
    @grupo_estudiantil = GrupoEstudiantil.find(params[:id])

    respond_to do |format|
      if @grupo_estudiantil.update_attributes(params[:grupo_estudiantil])
        flash[:notice] = 'Grupo Estudiantil editado exitosamente'
        format.html { redirect_to(@grupo_estudiantil) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grupo_estudiantil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos_estudiantiles/1
  # DELETE /grupos_estudiantiles/1.xml
  def destroy
    @grupo_estudiantil = GrupoEstudiantil.find(params[:id])
    @grupo_estudiantil.destroy

    respond_to do |format|
      format.html { redirect_to(grupos_estudiantiles_url) }
      format.xml  { head :ok }
    end
  end
end
