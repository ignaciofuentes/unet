class EstudiantesController < ApplicationController
  # GET /estudiantes
  # GET /estudiantes.xml
  filter_resource_access
  def index
    
    if has_role? :admin
      @estudiantes = Estudiante.all
    else
      @estudiantes = current_user.grupo_estudiantil.universidad.estudiantes
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estudiantes }
    end
  end

  # GET /estudiantes/1
  # GET /estudiantes/1.xml
  def show
    @estudiante = Estudiante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estudiante }
    end
  end

  # GET /estudiantes/new
  # GET /estudiantes/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estudiante }
    end
  end

  # GET /estudiantes/1/edit
  def edit
  end

  # POST /estudiantes
  # POST /estudiantes.xml
  def create
    
      if !has_role? :admin
          @estudiante.universidad = current_user.grupo_estudiantil.universidad
      end
    respond_to do |format|
      if @estudiante.save
        format.html { redirect_to(@estudiante, :notice => 'El Estudiante fue creado exitosamente') }
        format.xml  { render :xml => @estudiante, :status => :created, :location => @estudiante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estudiante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estudiantes/1
  # PUT /estudiantes/1.xml
  def update
    respond_to do |format|
      if @estudiante.update_attributes(params[:estudiante])
        format.html { redirect_to(@estudiante, :notice => 'El Estudiante fue editado exitosamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estudiante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.xml
  def destroy
    @estudiante.destroy

    respond_to do |format|
      format.html { redirect_to(estudiantes_url) }
      format.xml  { head :ok }
    end
  end
end
